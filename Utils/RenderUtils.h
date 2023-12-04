#include "IMGUI/imgui.h"
#import "Utils/Obfuscate.h"

void drawCenteredString(const char* text) {
    auto windowWidth = ImGui::GetWindowSize().x;
    auto textWidth = ImGui::CalcTextSize(text).x;
    ImGui::SetCursorPosX((windowWidth - textWidth) * 0.5f);
    ImGui::Text("%s", ENCRYPT(text));
}