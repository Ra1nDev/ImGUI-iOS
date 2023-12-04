#import "PubgLoad.h"
#import <UIKit/UIKit.h>

#import "JH/JHPP.h"
#import "JH/JHDragView.h"
#import "JH/JHUIViewControllerDecoupler.h"
#import "ImGuiLoad.h"
#import "ImGuiDrawView.h"

@interface PubgLoad()
@property (nonatomic, strong) ImGuiDrawView *vna;
@end

@implementation PubgLoad

static PubgLoad *extraInfo;

UIWindow *mainWindo;


+ (void)load
{
[super load];
 
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             mainWindo = [UIApplication sharedApplication].keyWindow;
            extraInfo =  [PubgLoad new];
            [extraInfo initTapGes];
            [extraInfo tapIconView];
            [extraInfo tapIconView2];
          
        });
        
    }

-(void)initTapGes
{
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 2;//点击次数
    tap.numberOfTouchesRequired = 3;//手指数
    [[JHPP currentViewController].view addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(tapIconView)];
}

-(void)tapIconView2
{
 if (!_vna) {
     ImGuiDrawView *vc = [[ImGuiDrawView alloc] init];
     _vna = vc;
 }
 
 [ImGuiDrawView showChange:false];
 [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:_vna.view];
}

-(void)tapIconView
{
 if (!_vna) {
     ImGuiDrawView *vc = [[ImGuiDrawView alloc] init];
     _vna = vc;
 }
 
 [ImGuiDrawView showChange:true];
 [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:_vna.view];
}
@end
