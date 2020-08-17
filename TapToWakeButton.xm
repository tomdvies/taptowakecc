#import "TapToWakeButton.h"

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

BOOL blocking=NO;
NSUserDefaults *userDefaults = nil;

@implementation CTXTestModule
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Lock" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor blueColor];
}

- (BOOL)isSelected {
    if (userDefaults == nil) userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL enabled =  [userDefaults boolForKey:@"com.tmded.taptowakecc.enabled"];
    return enabled;
}

- (void)setSelected:(BOOL)selected{
    if (userDefaults == nil) userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setBool:selected forKey: @"com.tmded.taptowakecc.enabled"];
    self.fakeEnabledSetting = selected;
    [super refreshState];
}
@end




