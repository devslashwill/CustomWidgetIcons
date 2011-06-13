#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BBWeeAppController-Protocol.h"

float VIEW_HEIGHT = 70.0f;

@interface HelloWorldController : NSObject <BBWeeAppController>
{
	UIView *_view;
}

@end

@implementation HelloWorldController

- (id)init
{
	if ((self = [super init]))
	{
		
	}
	return self;
}

- (UIView *)view
{
	if (!_view)
	{
		_view = [[UIView alloc] initWithFrame:CGRectMake(2.0f, 0.0f, 316.0f, VIEW_HEIGHT)];

		UIImage *bgImg = [[UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/StocksWeeApp.bundle/WeeAppBackground.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(35.0f, 4.0f, 35.0f, 4.0f)];
        UIImageView *bg = [[UIImageView alloc] initWithImage:bgImg];
        bg.frame = CGRectMake(0.0f, 0.0f, 316.0f, VIEW_HEIGHT);
        [_view addSubview:bg];
        [bg release];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 316.0f, 71.0f)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor whiteColor];
        lbl.text = @"Hello World";
        lbl.textAlignment = UITextAlignmentCenter;
        [_view addSubview:lbl];
        [lbl release];
	}

	return _view;
}

- (float)viewHeight
{
	return VIEW_HEIGHT;
}

@end
