BOOL blocking = NO;

%hook SBLockScreenManager
- (void)_wakeScreenForTapToWake{
    //RLog(@"damn");
    if (!blocking) %orig;
    return;
}
%end

void enable(){
    blocking=YES;
}

void disable(){
    blocking=NO;
}

%ctor{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    (CFNotificationCallback)enable,
                                    CFSTR("com.tmded.taptowakecc.enable"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
            NULL,
            (CFNotificationCallback)disable,
            CFSTR("com.tmded.taptowakecc.disable"),
            NULL,
            CFNotificationSuspensionBehaviorDeliverImmediately);
}
