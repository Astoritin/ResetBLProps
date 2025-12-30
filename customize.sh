#!/system/bin/sh
SKIPUNZIP=1

MOD_PROP="${TMPDIR}/module.prop"
MOD_NAME="$(grep_prop name "$MOD_PROP")"
MOD_VER="$(grep_prop version "$MOD_PROP") ($(grep_prop versionCode "$MOD_PROP"))"

extract() {
    file=$1
    dir=$2
    junk=${3:-false}
    opts="-o"

    [ -z "$dir" ] && dir="$MODPATH"
    file_path="$dir/$file"
    hash_path="$TMPDIR/$file.sha256"

    if [ "$junk" = true ]; then
        opts="-oj"
        file_path="$dir/$(basename "$file")"
        hash_path="$TMPDIR/$(basename "$file").sha256"
    fi

    unzip $opts "$ZIPFILE" "$file" -d "$dir" >&2
    [ -f "$file_path" ] || abort "! $file does NOT exist"

    unzip $opts "$ZIPFILE" "${file}.sha256" -d "$TMPDIR" >&2
    [ -f "$hash_path" ] || abort "! ${file}.sha256 does NOT exist"

    expected_hash="$(cat "$hash_path")"
    calculated_hash="$(sha256sum "$file_path" | cut -d ' ' -f1)"

    if [ "$expected_hash" == "$calculated_hash" ]; then
        ui_print "- Verified $file" >&1
    else
        abort "! Failed to verify $file"
    fi
}

ui_print "- Setting up $MOD_NAME"
ui_print "- Version: $MOD_VER"
extract "customize.sh" "$TMPDIR"
extract "module.prop"
extract "reset_bl_props.sh" "$TMPDIR"
cat "$TMPDIR/reset_bl_props.sh" > "/data/adb/service.d/reset_bl_props.sh"
chmod +x "/data/adb/service.d/reset_bl_props.sh"
extract "uninstall.sh"
ui_print "- Setting permissions"
set_perm_recursive "$MODPATH" 0 0 0755 0644
ui_print "- Welcome to $MOD_NAME!"