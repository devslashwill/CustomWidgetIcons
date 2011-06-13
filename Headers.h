#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSSpecifier :  NSObject
@end

@interface BBSectionInfo : NSObject
@property (nonatomic, copy) NSString *pathToWeeAppPluginBundle;
@end

@interface BulletinBoardController : NSObject
- (int)indexForIndexPath:(NSIndexPath *)indexPath;
- (PSSpecifier *)specifierAtIndex:(int)index;
@end

@interface PSSpecifier (CustomWidgetIcons)
- (UIImage *)customIconImage;
- (void)setCustomIconImage:(UIImage *)image;
@end