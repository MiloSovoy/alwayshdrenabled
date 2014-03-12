NSString *settingsPath = @"/var/mobile/Library/Preferences/com.milodarling.alwayshdrenabled~prefs.plist";
NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];

%hook PLCameraController

-(BOOL) isHDREnabled {

	if (enabled == TRUE) {
		return TRUE;
	}

	else {
		return %orig;
	}

}
-(BOOL) hasFlash {

	if (enabled == TRUE) {
		return FALSE;
	}

	else {
		return %orig;
	}
}
%end