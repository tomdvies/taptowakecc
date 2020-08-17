BOOL blocking = NO;

NSUserDefaults *userDefaults = nil;

%hook SBLockScreenManager
- (void)_wakeScreenForTapToWake{
    //RLog(@"damn");
    if (![userDefaults boolForKey:@"com.tmded.taptowakecc.enabled"]) %orig;
    return;
}
%end


%ctor{
    userDefaults = [NSUserDefaults standardUserDefaults];
}
