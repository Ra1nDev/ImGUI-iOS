#import "Utils/KittyMemory/writeData.hpp"
#import "Utils/KittyMemory/MemoryPatch.hpp"
#import <Foundation/Foundation.h>
#include <mach-o/dyld.h>
#include <substrate.h>

#define OrigHook(offset, ptr, orig) MSHookFunction((void *)getRealOffset(offset), (void *)ptr, (void **)&orig)
#define NoOrigHook(offset, ptr) MSHookFunction((void *)getRealOffset(offset), (void *)ptr, NULL)

#define SymHook(sym, ptr, org) MSHookFunction((void*)dlsym((void *)RTLD_DEFAULT, sym), (void *)ptr, (void **)&org)
#define NoOrigSymHook(sym, ptr)  MSHookFunction((void*)dlsym((void *)RTLD_DEFAULT, sym), (void *)ptr, NULL)
#define GetSym(symName) dlsym((void *)RTLD_DEFAULT, symName)

#define UIColorFromHex(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0]

uint64_t getRealOffset(uint64_t offset){
	return KittyMemory::getAbsoluteAddress("UnityFramework", offset);
}

void patchOffset(uint64_t offset, std::string hexBytes) {
    MemoryPatch patch = MemoryPatch::createWithHex("UnityFramework", offset, hexBytes);
}