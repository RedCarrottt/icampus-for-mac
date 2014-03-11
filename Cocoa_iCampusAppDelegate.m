//
//  Cocoa_iCampusAppDelegate.m
//  Cocoa_iCampus
//
//  Created by RedCarrottt on 10. 9. 26..
//  Copyleft 2010 RedCarrottt. All rights not reserved.
//  License : GNU GPL v2 (see http://www.gnu.org/licenses/ )
//  

#import "Cocoa_iCampusAppDelegate.h"
#import "iCampusConstants.h"

@implementation Cocoa_iCampusAppDelegate
@synthesize idField, passwordField, saveIDCheckButton, savePasswordCheckButton, terminateItselfCheckButton;

@synthesize window;

-(IBAction) okButtonClicked: (id) sender {
	NSMutableString * urlString = [[NSMutableString stringWithString:SEED_URL] autorelease];
	[urlString appendFormat:@"&loginId=%@",[idField stringValue]];
	[urlString appendFormat:@"&userPasswd=%@", [passwordField stringValue]];
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];
	
	if([terminateItselfCheckButton state] == NSOnState) {
		[NSApp terminate:nil];
	}
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// 초기화
	NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
	if(userDefaults){
		[idField setStringValue: [userDefaults objectForKey:DEFKEY_USER_ID]];
		[passwordField setStringValue: [userDefaults objectForKey:DEFKEY_USER_PASSWORD]];
		[saveIDCheckButton setState:[userDefaults integerForKey:DEFKEY_SAVE_ID]];
		[savePasswordCheckButton setState:[userDefaults integerForKey:DEFKEY_SAVE_PASSWORD]];
		[terminateItselfCheckButton setState:[userDefaults integerForKey:DEFKEY_TERMINATE_ITSELF]];
	}
}

- (void)applicationWillTerminate:(NSNotification *)notification {
	// 상태 저장
	NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
	if([NSUserDefaults standardUserDefaults]) {
		if([saveIDCheckButton state] == NSOnState) {
			[userDefaults setObject:[idField stringValue] forKey:DEFKEY_USER_ID];
		}
		else {
			[userDefaults setObject:@"" forKey:DEFKEY_USER_ID];
		}

		if([savePasswordCheckButton state] == NSOnState) {
			[userDefaults setObject:[passwordField stringValue] forKey:DEFKEY_USER_PASSWORD];
		}
		else {
			[userDefaults setObject:@"" forKey:DEFKEY_USER_PASSWORD];
		}
		[userDefaults setInteger:[saveIDCheckButton state] forKey:DEFKEY_SAVE_ID];
		[userDefaults setInteger:[savePasswordCheckButton state] forKey:DEFKEY_SAVE_PASSWORD];
		[userDefaults setInteger:[terminateItselfCheckButton state] forKey:DEFKEY_TERMINATE_ITSELF];
		[userDefaults synchronize];
	}
}

@end
