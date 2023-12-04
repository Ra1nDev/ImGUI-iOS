# HuyJIT-ModMenu
Huy JIT Mod Menu is a template menu for iOS that supported patching offsets/hexes for rootful only (maybe JIT/NonJB support soon)!

<div style="text-align: center;">
<b>Preview of the menu</b><br>

<img src="https://raw.githubusercontent.com/Ra1nDev/ImGUI-iOS/main/Preview.png">
</div>


# About
- I'm using KittyMemory to patch the offsets/hexes
- Kopycat some code from [joeyjurjens](https://github.com/joeyjurjens/iOS-Mod-Menu-Template-for-Theos)
- Also bring encryption from [joeyjurjens](https://github.com/joeyjurjens/iOS-Mod-Menu-Template-for-Theos) template too
- Hook by MSHookFunction (maybe NonJB hooks later)

# Installation
- Using theos for compilation
- Add ```THEOS_PACKAGE_SCHEME = rootless``` to support Dopamine if you want 

# Feature
- On/Off switch for patching offsets
- Support Hooking (by MobileSubstrate)

# Usage
**3 fingers double tap to screen to open menu, 2 fingers double tap to disable menu**

Editing these in `Draw.mm`

- Patching offset on `UnityFramework`
```obj-c
patchOffset(ENCRYPTOFFSET("0x123F456"), ENCRYPTHEX("0xC0035FD6"));
```
You can change this to anything you want to patch on the line where I noted in `Utils/Wrapper.h`. Normally it's `UnityFramework` but some games like LoL WildRift is `FEProj`

- Hooking a static address (both `NULL` and `UnityFramework`)
```obj-c
void (*inst)(void *instance);
void _inst(void *instance){
    inst(instance);
}

OrigHook(ENCRYPTOFFSET("0x123F456), _inst, inst)
```
- Font using for this menu is Honkai Star Rail font (**English only**)

### Pull request button is on the top, you can contribute to this project if you want

# Credits
- [Ra1nDev](https://github.com/Ra1nDev)
- Huy Nguyen [34306](https://github.com/34306)
- [x2nios](https://github.com/x2niosvn) for [IMGUI Mod Menu](https://github.com/x2niosvn/iOS-IMGUI-Mod-Menu-Templates)
- [joeyjurjens](https://github.com/joeyjurjens) for [iOS Mod Menu](https://github.com/joeyjurjens/iOS-Mod-Menu-Template-for-Theos)
- [Dobby](https://github.com/jmpews/Dobby) by [jmpews](https://github.com/jmpews) (Apache-2.0 license)
- Special thanks to: Red16, tuancc, YeetDisDude, [modfs] AloH, HappySecret and Lavochka (H5GG Discord)
