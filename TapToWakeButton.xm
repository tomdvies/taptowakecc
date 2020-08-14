#import "TapToWakeButton.h"

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

BOOL blocking=NO;

@implementation CTXTestModule
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Lock" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor blueColor];
}

- (BOOL)isSelected {
	return self.fakeEnabledSetting;
}

- (void)setSelected:(BOOL)selected{
	self.fakeEnabledSetting = selected;
    if (selected)CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.tmded.taptowakecc.enable"), NULL, NULL, YES);
    else CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.tmded.taptowakecc.disable"), NULL, NULL, YES);
    [super refreshState];
}
@end




