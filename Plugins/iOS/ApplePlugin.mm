#import <UIKit/UIKit.h>
#import "UnityInterface.h"

extern "C" {

    void _SetStatusBarVisible(bool visible) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIViewController *vc = UnityGetGLViewController();
            UIApplication *app = [UIApplication sharedApplication];
            
            // Inform Unity to update the appearance
            [UIApplication.sharedApplication setStatusBarHidden:!visible withAnimation:UIStatusBarAnimationFade];
            [vc setNeedsStatusBarAppearanceUpdate];
        });
    }

    void _SetStatusBarStyle(int style) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIViewController *vc = UnityGetGLViewController();
            UIStatusBarStyle barStyle = UIStatusBarStyleDefault;

            switch(style) {
                case 0: barStyle = UIStatusBarStyleDefault; break;  // Automatic
                case 1: barStyle = UIStatusBarStyleLightContent; break;
                case 2:
                    if (@available(iOS 13.0, *)) {
                        barStyle = UIStatusBarStyleDarkContent;
                    } else {
                        barStyle = UIStatusBarStyleDefault;
                    }
                    break;
            }

            [[UIApplication sharedApplication] setStatusBarStyle:barStyle animated:YES];
            [vc setNeedsStatusBarAppearanceUpdate];
        });
    }
}
