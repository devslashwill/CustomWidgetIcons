#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface PSSpecifier :  NSObject
@end

@interface BBSectionInfo : NSObject
@property (nonatomic, copy) NSString *pathToWeeAppPluginBundle;
@property (nonatomic, copy) NSString *sectionID;
@end

@interface BulletinBoardController : NSObject
- (int)indexForIndexPath:(NSIndexPath *)indexPath;
- (PSSpecifier *)specifierAtIndex:(int)index;
@end

@interface PSSpecifier (CustomWidgetIcons)
- (UIImage *)customIconImage;
- (void)setCustomIconImage:(UIImage *)image;
@end

@interface NotificationCell : NSObject
@property (nonatomic, copy) NSString *bundlePath;
@end

@interface SBBulletinListSection : NSObject
@property(retain, nonatomic) UIImage *iconImage;
@property(copy, nonatomic) NSString *displayName;
- (BOOL)isWidgetSection;
@end