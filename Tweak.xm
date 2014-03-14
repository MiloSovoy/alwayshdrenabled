NSString *settingsPath = @"/var/mobile/Library/Preferences/com.milodarling.alwayshdrenabled~prefs.plist";
NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];

%hook PLCameraController

-(BOOL) isHDREnabled {

	if (enabled == FALSE) {
		return %orig;
	}

	else {
		return TRUE;
	}

}
-(BOOL) hasFlash {

	if (enabled == FALSE) {
		return %orig;
	}

	else {
		return FALSE;
	}
}
%end

%hook CAMHDRButton

-(BOOL) isOn {
	if (enabled == FALSE) {
		return %orig;
	}
	
	else {
		return TRUE;
	}
	
}

-(void) setOn:(BOOL)arg1 {

	if (enabled == FALSE) {
		%orig(arg1);
	}
	
	else {
		arg1 = TRUE;
		%orig(arg1);
	}
	
}

-(BOOL) hdrIsOn {

	if (enabled == FALSE) {
		return %orig;
	}
	
	else {
		return TRUE;
	}

}

-(id) _onLabel {

	if (enabled == FALSE) {
		return %orig;
	}
	
	else {
		return @"Always HDR";
	}
	
}	
		
%end

void loadPreferences() {
    NSLog(@"AlwaysHDREnabled--Settings updated");
}

%ctor {
    // Initialization stuff
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    (CFNotificationCallback)loadPreferences,
                                    CFSTR("com.milodarling.alwayshdrenabled~prefs/prefschanged"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
    
    loadPreferences();
}
