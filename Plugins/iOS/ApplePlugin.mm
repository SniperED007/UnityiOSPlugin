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

    bool _IsHapticsSupported()
    {
    #if TARGET_OS_IOS
        // UIImpactFeedbackGenerator is iOS 10.0+
        float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
        return (systemVersion >= 10.0f);
    #else
        return false;
    #endif
    }

    // Single function that takes an int to decide which haptic feedback to play.
    // 0 = LightImpact, 1 = MediumImpact, 2 = HeavyImpact,
    // 3 = Success,     4 = Warning,      5 = Error
    void _PlayHaptic(int hapticType)
    {
    #if TARGET_OS_IOS
        if (@available(iOS 10.0, *))
        {
            switch (hapticType)
            {
                case 0: // LightImpact
                {
                    UIImpactFeedbackGenerator *generator =
                        [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
                    [generator prepare];
                    [generator impactOccurred];
                    break;
                }
                case 1: // MediumImpact
                {
                    UIImpactFeedbackGenerator *generator =
                        [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
                    [generator prepare];
                    [generator impactOccurred];
                    break;
                }
                case 2: // HeavyImpact
                {
                    UIImpactFeedbackGenerator *generator =
                        [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
                    [generator prepare];
                    [generator impactOccurred];
                    break;
                }
                case 3: // Success
                {
                    UINotificationFeedbackGenerator *generator =
                        [[UINotificationFeedbackGenerator alloc] init];
                    [generator prepare];
                    [generator notificationOccurred:UINotificationFeedbackTypeSuccess];
                    break;
                }
                case 4: // Warning
                {
                    UINotificationFeedbackGenerator *generator =
                        [[UINotificationFeedbackGenerator alloc] init];
                    [generator prepare];
                    [generator notificationOccurred:UINotificationFeedbackTypeWarning];
                    break;
                }
                case 5: // Error
                {
                    UINotificationFeedbackGenerator *generator =
                        [[UINotificationFeedbackGenerator alloc] init];
                    [generator prepare];
                    [generator notificationOccurred:UINotificationFeedbackTypeError];
                    break;
                }
            }
        }
    #endif
    }

}

