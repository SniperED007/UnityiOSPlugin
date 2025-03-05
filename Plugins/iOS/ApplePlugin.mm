#import <UIKit/UIKit.h>

extern "C"
{
    void _SetStatusBarVisible(bool visible)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setStatusBarHidden:!visible withAnimation:UIStatusBarAnimationFade];
        });
    }

    void _SetStatusBarStyle(int style)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIStatusBarStyle statusBarStyle = UIStatusBarStyleDefault;
            if (@available(iOS 13.0, *)) {
                switch (style) {
                    case 1:
                        statusBarStyle = UIStatusBarStyleLightContent;
                        break;
                    case 2:
                        statusBarStyle = UIStatusBarStyleDarkContent;
                        break;
                    default:
                        statusBarStyle = UIStatusBarStyleDefault;
                        break;
                }
            } else {
                statusBarStyle = (style == 1) ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
            }

            UIViewController *vc = UnityGetGLViewController();
            [vc setNeedsStatusBarAppearanceUpdate];

            [UIApplication sharedApplication].statusBarStyle = statusBarStyle;
        });
    }
}
