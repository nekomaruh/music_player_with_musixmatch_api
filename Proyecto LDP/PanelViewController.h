//
//  PanelViewController.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 6/5/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globals/Globals.h"


NS_ASSUME_NONNULL_BEGIN

@interface PanelViewController : UIViewController
- (IBAction)buttonClosePanel:(id)sender;
@property Globals *g;
- (void)setBackgroundImage:(UIImageView *)backgroundImage;
@property (strong, nonatomic) IBOutlet UIImageView *musicThumb;
@property (strong, nonatomic) IBOutlet UIImageView *musicThumbBackground;
@property (strong, nonatomic) IBOutlet UILabel *musicLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UIButton *buttonForward;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlay;
@property (strong, nonatomic) IBOutlet UIButton *buttonNext;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundData;
- (IBAction)lyricsButton:(id)sender;
- (IBAction)slide:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *slider;
- (IBAction)btnPlay:(id)sender;



@end

NS_ASSUME_NONNULL_END
