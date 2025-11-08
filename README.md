## ResetBLProps
Reset Bootloader Properties as factory default values.   
---
重置 Bootloader 属性值为出厂值。   

## Supported Root Solution | 支持的 Root 方案
   
[Magisk](https://github.com/topjohnwu/Magisk) | [KernelSU](https://github.com/tiann/KernelSU) | [APatch](https://github.com/bmax121/APatch)

## NOTICE | 注意
   
**This module incorporates bootloader properties reset scripts extracted from [Shamiko](https://github.com/LSPosed/LSPosed.github.io). Special thanks to [LSPosed Developers](https://github.com/LSPosed) for their original work!**
---
**该模块包含了源自 [Shamiko](https://github.com/LSPosed/LSPosed.github.io) 的 Bootloader 属性值重置脚本。非常感谢 [LSPosed Developers](https://github.com/LSPosed) 的工作！**

## Why does this module exist? | 为什么存在这个模块？
   
- Shamiko has been merged into Zygisk Next and Shamiko won't be maintained anymore.
- Its bootloader properties reset script won't be merged due to some reasons.
---
- Shamiko 已经被合并至 Zygisk Next 且不再维护。
- 由于某些原因，Shamiko 的 Bootloader 属性值重置脚本不会被合并。   
   
> Why does bootloader properties reset script not merge into Zygisk Next?
> 为什么 Bootloader 属性值重置脚本并未被合并至 Zygisk Next?
> *For clearer module functionality*——Zygisk Next is a module providing Zygisk API instead of hiding Root. The hiding of bootloader properties details is not Zygisk Next's responsibility to do.
> *为了使模块功能更清晰明确*——Zygisk Next 是用于提供 Zygisk API 的模块而不是隐藏 Root. 隐藏 Bootloader 属性值细节不是 Zygisk Next 的范畴。
