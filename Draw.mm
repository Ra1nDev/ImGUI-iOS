#import "Utils/Headers.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@end

@implementation ImGuiDrawView

auto PageOneColor   = ImColor(0.571f, 0.000f, 1.000f, 1.000f);
auto PageTwoColor   = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
auto PageThreeColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
auto PageFourColor  = ImColor(0.347f, 0.089f, 0.502f, 1.000f);


static double lastClickTime = 0.0;


static bool MenuVisible = true;


- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;

    ImGui::StyleColorsDark();
    
    ImFont* font = io.Fonts->AddFontFromMemoryCompressedTTF((void*)Honkai_compressed_data, Honkai_compressed_size, 45.0f, NULL, io.Fonts->GetGlyphRangesDefault());
    
    ImGui_ImplMetal_Init(_device);

    return self;
}

+ (void)showChange:(BOOL)open
{
    MenuVisible = open;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView
{

 

    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;

}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view
{
   
    
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.scale ?: UIScreen.mainScreen.scale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 120);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    
    
    int page = 1;
    
//Define your bool/function in here
    static bool show_s0 = false;    
    static bool show_s1 = false;    
    static bool show_s2 = false;    
    static bool show_s3 = false;    
    static bool show_s4 = false;    
    static bool show_s5 = false;    
    static bool show_s6 = false;                    
    static bool show_s7 = false;        
    static bool show_s8 = false;      
    static bool show_s9 = false;     
    static bool show_s10 = false;     
    static bool show_s11 = false;     
    static bool show_s12 = false;     

//Define active function
    static bool show_s0_active = false;
    
        
        if (MenuVisible == true) {
            [self.view setUserInteractionEnabled:YES];
        } else if (MenuVisible == false) {
            [self.view setUserInteractionEnabled:NO];
        }

        MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
        if (renderPassDescriptor != nil)
        {
            id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
            [renderEncoder pushDebugGroup:@"PabloTap"];

            ImGui_ImplMetal_NewFrame(renderPassDescriptor);
            ImGui::NewFrame();
            
            ImFont* font = ImGui::GetFont();
            font->Scale = 15.f / font->FontSize;
            
            CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 360) / 2;
            CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 300) / 2;
            
            ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
            ImGui::SetNextWindowSize(ImVec2(400, 300), ImGuiCond_FirstUseEver);
            
            if (MenuVisible == true) {   
                Theme();             
                ImGui::SetNextWindowSize(ImVec2(500.000f, 320.000f), ImGuiCond_Once);
	          ImGui::Begin("", NULL, 3);
                
                
                
                
                
                
                
	          ImVec2 P1, P2;
	          ImDrawList* pDrawList;
	          const auto& CurrentWindowPos = ImGui::GetWindowPos();
	          const auto& pWindowDrawList = ImGui::GetWindowDrawList();
	          const auto& pBackgroundDrawList = ImGui::GetBackgroundDrawList();
	          const auto& pForegroundDrawList = ImGui::GetForegroundDrawList();

                P1 = ImVec2(1.000f, 4.000f);
                P1.x += CurrentWindowPos.x;
                P1.y += CurrentWindowPos.y;
                P2 = ImVec2(498.000f, 10.000f);
                P2.x += CurrentWindowPos.x;
                P2.y += CurrentWindowPos.y;
                pDrawList = pWindowDrawList;
                pDrawList->AddRectFilledMultiColor(P1, P2, ImColor(0.909f, 0.000f, 1.000f, 1.000f), ImColor(0.000f, 1.000f, 1.000f, 1.000f), ImColor(0.041f, 0.639f, 0.784f, 1.000f), ImColor(0.987f, 0.000f, 1.000f, 1.000f));
    
                ImGui::SetCursorPosY(10.0f);
                auto uugabuga = ImGui::GetWindowSize().x;
                auto ugabuga = ImGui::CalcTextSize("GitHub").x;
                ImGui::SetCursorPosX((uugabuga - ugabuga) * 0.5f - 3);
                ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(1.0f, 0.0f, 0.0f, 0.0f));
                ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(1.0f, 0.0f, 0.0f, 0.0f));
                ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(1.0f, 0.0f, 0.0f, 0.0f));
                if(ImGui::Button("GitHub", ImVec2(ugabuga + 3, 18.000f))) {
                    double currentTime = ImGui::GetTime();
                    double deltaTime = currentTime - lastClickTime;
    
                    if (deltaTime < 0.3) {
                        MenuVisible = false;
                    }
                    lastClickTime = currentTime;
                }
                ImGui::PopStyleColor();
                ImGui::PopStyleColor();
                ImGui::PopStyleColor();

                ImGui::SetCursorPosY(30.0f);
                ImGui::PushStyleColor(ImGuiCol_ChildBg,ImColor(39,39,39).Value);
                ImGui::BeginChild("Content",ImVec2(484, 40));{
                
                ImGui::SetCursorPosY(5.0f);
                ImGui::SetCursorPosX(5.0f);
                
                ImGui::PushStyleColor(ImGuiCol_Button, static_cast<ImU32>(PageOneColor));
                if (ImGui::Button("Visuals", ImVec2(110.8f, 30.000f))) {
                    Pages::Current = 1;
                    PageOneColor = ImColor(0.571f, 0.000f, 1.000f, 1.000f);
                    PageTwoColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageThreeColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageFourColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
	          }
                ImGui::PopStyleColor();
                
	          ImGui::SameLine(0,10);
                
                ImGui::PushStyleColor(ImGuiCol_Button, static_cast<ImU32>(PageTwoColor));
	          if (ImGui::Button("Aiming", ImVec2(110.8f, 30.000f))) {
	              Pages::Current = 2;
                    PageOneColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageTwoColor = ImColor(0.571f, 0.000f, 1.000f, 1.000f);
                    PageThreeColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageFourColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
	          }
                ImGui::PopStyleColor();
                
	          ImGui::SameLine(0,10);
                
                ImGui::PushStyleColor(ImGuiCol_Button, static_cast<ImU32>(PageThreeColor));
	          if (ImGui::Button("Skins", ImVec2(110.8f, 30.000f))) {
	              Pages::Current = 3;
                    PageOneColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageTwoColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageThreeColor = ImColor(0.571f, 0.000f, 1.000f, 1.000f);
                    PageFourColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    
	          }
                ImGui::PopStyleColor();

                ImGui::SameLine(0,10);
                
                ImGui::PushStyleColor(ImGuiCol_Button, static_cast<ImU32>(PageFourColor));

                if (ImGui::Button("Info", ImVec2(110.8f, 30.000f))) {
	              Pages::Current = 4;
                    PageOneColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageTwoColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageThreeColor = ImColor(0.347f, 0.089f, 0.502f, 1.000f);
                    PageFourColor = ImColor(0.571f, 0.000f, 1.000f, 1.000f);
	          }
		    ImGui::PopStyleColor();
                
	}
	ImGui::EndChild();
	ImGui::PopStyleColor();
	
	ImGui::PushStyleColor(ImGuiCol_ChildBg,ImColor(39,39,39).Value);
ImGui::BeginChild("Test2",ImVec2(484, 238));
	{
	if (Pages::Current == 1) {
		ImGui::Text(":(");
	}
	if (Pages::Current == 2) {
		ImGui::Text("Test");
	}
      if (Pages::Current == 3) {
		ImGui::Text("Test1");
	}
	if (Pages::Current == 4) {
		ImGui::Text("Test2");
	}
	}
	ImGui::EndChild();
	ImGui::PopStyleColor();
	ImGui::End();
            }
            ImDrawList* draw_list = ImGui::GetBackgroundDrawList();



//Okay so this is the space we place our cheat function
//This function below maybe outdated, idk. But it's an example how we can use


            ImGui::Render();
            ImDrawData* draw_data = ImGui::GetDrawData();
            ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
          
            [renderEncoder popDebugGroup];
            [renderEncoder endEncoding];

            [commandBuffer presentDrawable:view.currentDrawable];
        }

        [commandBuffer commit];
}

void patches() {
    Patches.testfunc1 = MemoryPatch::createWithHex(ENCRYPT("UnityFramework"), ENCRYPTOFFSET("0x1D2E75C"), ENCRYPTHEX("0xC0035FD6"));
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}

void *init(void *) {
    sleep(5);
    patches();
    pthread_exit(nullptr);
    return nullptr;
}

void __attribute__((constructor)) initialize() {
    pthread_t inithack;
    pthread_create(&inithack, NULL, init, NULL); 
}

@end

