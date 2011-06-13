#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BBWeeAppController <NSObject>
- (UIView *)view;

@optional
- (float)viewHeight;
- (void)viewWillAppear;
- (void)viewDidAppear;
- (void)viewWillDisappear;
- (void)viewDidDisappear;
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation;
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orientation;
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)orientation;
- (void)loadPlaceholderView;
- (void)loadFullView;
- (void)unloadView;
- (void)loadView;
- (NSURL *)launchURL;
- (NSURL *)launchURLForTapLocation:(CGPoint)location;
@end
