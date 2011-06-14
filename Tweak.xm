#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "Headers.h"

@implementation PSSpecifier (CustomWidgetIcons)

- (UIImage *)customIconImage
{
    return (UIImage *)objc_getAssociatedObject(self, "CustomWidgetIcon");
}

- (void)setCustomIconImage:(UIImage *)image
{
    objc_setAssociatedObject(self, "CustomWidgetIcon", image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

%hook BulletinBoardController

- (PSSpecifier *)_applicationSpecifierForBBSection:(BBSectionInfo *)section
{
    PSSpecifier *specifier = %orig;
    
    NSDictionary *infoPlist = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Info.plist", section.pathToWeeAppPluginBundle]];
    UIImage *icon = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", section.pathToWeeAppPluginBundle, [infoPlist objectForKey:@"CFBundleIconFile"]]];
    [specifier setCustomIconImage:icon];
    
    return specifier;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section > 1)
    {
        PSSpecifier *specifier = [self specifierAtIndex:[self indexForIndexPath:indexPath]];
        if ([specifier customIconImage])
        {
            id cell = %orig;
            [MSHookIvar<UIImageView *>(cell, "_appIcon") setImage:[specifier customIconImage]];
            return cell;
        }
    }
    
    return %orig;
}

%end

