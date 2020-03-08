//
//  PanelViewController.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 6/5/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "PanelViewController.h"
#import "Globals/Globals.h"
#import "MXMLyricsAction.h"
#import <UIKit/UIKit.h>

@interface PanelViewController ()

@end

@implementation PanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _g = [Globals singleton];
    _musicThumb.image = _g.currentMusic.thumb;
    _musicThumbBackground.image = _g.currentMusic.thumb;
    
    _musicThumbBackground.contentMode = UIViewContentModeScaleAspectFill;
    _musicThumbBackground.alpha = 0.4f;
    
    CGSize imageSize = _musicThumbBackground.image.size;
    [_musicThumbBackground sizeThatFits:imageSize];
    CGPoint imageViewCenter = _musicThumbBackground.center;
    imageViewCenter.x = CGRectGetMidX(self.view.frame);
    [_musicThumbBackground setCenter:imageViewCenter];
    
    _musicThumb.layer.cornerRadius = 10;
    _musicThumb.clipsToBounds = YES;
    // border
    [_musicThumb.layer setBorderColor:[UIColor grayColor].CGColor];
    [_musicThumb.layer setBorderWidth:0.5f];

    _musicLabel.text = _g.currentMusic.title;
    _artistLabel.text = _g.currentMusic.artist;
    
    _buttonPlay.tintColor = [UIColor redColor];
    
    [self setBackgroundImage: _musicThumbBackground];
    
    _g = [Globals singleton];
    
    MPMusicPlayerController *mpc = _g.gblPlayerController;
    if ([mpc playbackState] == MPMusicPlaybackStatePlaying){
        UIImage *image = [UIImage imageNamed:@"pause.png"];
        _buttonPlay.imageView.image = image;
    }else{
        UIImage *image = [UIImage imageNamed:@"play.png"];
        _buttonPlay.imageView.image = image;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];

}

- (void)updateTime:(NSTimer *)timer {
    MPMusicPlayerController *mpc = _g.gblPlayerController;
    MPMediaItem *item = mpc.nowPlayingItem;
    _slider.value = mpc.currentPlaybackTime;
    _slider.maximumValue = item.playbackDuration;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Cambia la imagen de fondo al seleccionar una canción
- (void)setBackgroundImage:(UIImageView *)backgroundImage{
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    
    visualEffectView.frame = backgroundImage.bounds;
    [backgroundImage addSubview:visualEffectView];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.backgroundData.bounds byRoundingCorners:( UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.view.bounds;
    maskLayer.path  = maskPath.CGPath;
    self.backgroundData.layer.mask = maskLayer;
    
    

}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)buttonClosePanel:(id)sender {
    NSLog(@"%@", _g.currentMusic.title);
    //_musicThumb.image = _g.currentMusic.thumb;
    [self dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)lyricsButton:(id)sender {

    MPMusicPlayerController *mpc = _g.gblPlayerController;
    MPMediaItem *item = mpc.nowPlayingItem;

    //NSString *t = [item valueForProperty:MPMediaItemPropertyTitle];
    //NSLog(@"%@", item.title);
    NSLog(@"currentItem = %@", [item valueForProperty:MPMediaItemPropertyTitle]);
    
    MPMediaItemArtwork *artwork = [item valueForProperty:MPMediaItemPropertyArtwork];
    UIImage *image = [artwork imageWithSize:artwork.accessibilityFrame.size];
    
    //(MPMediaItemArtwork)mediaItem.ValueForKey(MPMediaItem.ArtworkProperty);

    if (item) {
        [[MXMLyricsAction sharedExtension] findLyricsForSongWithTitle:item.title
                                                               artist:item.artist
                                                                album:item.albumTitle
                                                              artWork:image
                                                      currentProgress:mpc.currentPlaybackTime
                                                        trackDuration:item.playbackDuration
                                                    forViewController:self
                                                               sender:sender
                                                     competionHandler:^(NSError *error) {
                                                     }];
    }
}

- (IBAction)slide:(id)sender {
    MPMusicPlayerController *mpc = _g.gblPlayerController;
    [mpc setCurrentPlaybackTime: [_slider value]];
}








- (IBAction)btnPlay:(id)sender {
    MPMusicPlayerController *mpc = _g.gblPlayerController;
    if ([mpc playbackState] == MPMusicPlaybackStatePlaying){
        [mpc pause];
        UIImage *image = [UIImage imageNamed:@"play.png"];
        [sender setImage:image forState:UIControlStateNormal];
    }else{
        [mpc play];
        UIImage *image = [UIImage imageNamed:@"pause.png"];
        [sender setImage:image forState:UIControlStateNormal];
    }
}
@end
