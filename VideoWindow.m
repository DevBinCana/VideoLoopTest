
#import "VideoWindow.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoWindow ()

@property (strong) IBOutlet AVPlayerView *playerView;
@property (strong) IBOutlet NSWindow *aspectView;

@end

@implementation VideoWindow

AVPlayer *player;
BOOL loopPlayer;

- (void) movieEndDetected:(NSNotification *) note
{
    if (loopPlayer) {
        [player seekToTime:kCMTimeZero];
        [player play];
    }
}

- (void)windowDidLoad {
    [super windowDidLoad];
    loopPlayer = YES;
    NSBundle *mb = [NSBundle mainBundle];
    NSURL *demoURL = [mb URLForResource:@"Video1" withExtension:@"mp4"];
    player = [[AVPlayer alloc] initWithURL:demoURL];
    self.playerView.player = player;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(movieEndDetected:)
               name:@"AVPlayerItemDidPlayToEndTimeNotification"
             object:player.currentItem];
    [_aspectView setAspectRatio:NSMakeSize(16, 9)];
            [player play];
}

- (void)windowWillClose:(NSNotification *)aNotification {
    [player pause];
    [player seekToTime:kCMTimeZero];
}

@end
