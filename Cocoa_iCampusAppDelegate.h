//
//  Cocoa_iCampusAppDelegate.h
//  Cocoa_iCampus
//
//  Created by RedCarrottt on 10. 9. 26..
//  Copyleft 2010 RedCarrottt. All rights not reserved.
//  License : GNU GPL v2 (see http://www.gnu.org/licenses/ )
//  
#import <Cocoa/Cocoa.h>

@interface Cocoa_iCampusAppDelegate : NSObject {//<NSApplicationDelegate> {
	NSWindow * window;
	
	NSTextField * idField;
	NSTextField * passwordField;
	NSButton * saveIDCheckButton;
	NSButton * savePasswordCheckButton;
	NSButton * terminateItselfCheckButton;
}

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) IBOutlet NSTextField * idField;
@property (nonatomic, retain) IBOutlet NSTextField * passwordField;
@property (nonatomic, retain) IBOutlet NSButton * saveIDCheckButton;
@property (nonatomic, retain) IBOutlet NSButton * savePasswordCheckButton;
@property (nonatomic, retain) IBOutlet NSButton * terminateItselfCheckButton;

-(IBAction) okButtonClicked: (id) sender;

@end
