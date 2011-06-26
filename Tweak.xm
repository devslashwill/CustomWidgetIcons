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
    
    if (section.pathToWeeAppPluginBundle)
    {
        NSDictionary *infoPlist = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Info.plist", section.pathToWeeAppPluginBundle]];
        UIImage *icon = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", section.pathToWeeAppPluginBundle, [infoPlist objectForKey:@"CFBundleIconFile"]]];
        [specifier setCustomIconImage:icon];
    }
    
    return specifier;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section > 1)
    {
        PSSpecifier *specifier = [self specifierAtIndex:[self indexForIndexPath:indexPath]];
        if ([specifier customIconImage])
        {
            UITableViewCell *cell = %orig;
            cell.imageView.image = [specifier customIconImage];
            return cell;
        }
    }
    
    return %orig;
}

%end

