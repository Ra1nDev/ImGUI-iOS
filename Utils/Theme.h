

void Theme() {
    ImVec4* Colors = ImGui::GetStyle().Colors;
    
    Colors[ImGuiCol_WindowBg] = ImVec4(0.000f, 0.000f, 0.000f, 1.000f);
    Colors[ImGuiCol_FrameBg] = ImVec4(0.792f, 0.056f, 1.000f, 0.540f);
    Colors[ImGuiCol_FrameBgHovered] = ImVec4(0.792f, 0.055f, 1.000f, 0.541f);
    Colors[ImGuiCol_FrameBgActive] = ImVec4(0.534f, 0.196f, 0.961f, 0.670f);
    Colors[ImGuiCol_CheckMark] = ImVec4(0.000f, 0.000f, 0.000f, 1.000f);
    Colors[ImGuiCol_Button] = ImVec4(0.347f, 0.089f, 0.502f, 1.000f);
    Colors[ImGuiCol_ButtonHovered] = ImVec4(0.493f, 0.005f, 0.610f, 1.000f);
    Colors[ImGuiCol_ButtonActive] = ImVec4(0.571f, 0.000f, 1.000f, 1.000f);
}