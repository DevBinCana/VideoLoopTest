#import "AppDelegate.h"
#import "VideoWindow.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)VideoWindow:(id)sender {
        if (!videoWindow) {
            videoWindow = [[VideoWindow alloc] initWithWindowNibName:@"VideoWindow"];
    }
        [videoWindow showWindow:self];
}
- (IBAction)VideoWindow2:(id)sender {
        if (!videoWindow) {
            videoWindow = [[VideoWindow alloc] initWithWindowNibName:@"VideoWindow"];
    }
        [videoWindow showWindow:self];
}

@end
