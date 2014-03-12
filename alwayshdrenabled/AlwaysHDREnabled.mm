#import <Preferences/Preferences.h>

@interface AlwaysHDREnabledListController: PSListController {
}
@end

@implementation AlwaysHDREnabledListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"AlwaysHDREnabled" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
