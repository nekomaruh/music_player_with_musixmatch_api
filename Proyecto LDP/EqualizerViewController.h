//
//  EqualizerViewController.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 7/21/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globals/Globals.h"

NS_ASSUME_NONNULL_BEGIN

@interface EqualizerViewController : UIViewController
- (IBAction)slider50:(id)sender;
- (IBAction)slider150:(id)sender;
- (IBAction)slider400:(id)sender;
- (IBAction)slider1k:(id)sender;
- (IBAction)slider2k:(id)sender;
- (IBAction)slider6k:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *slider150;
@property (strong, nonatomic) IBOutlet UISlider *slider50;
@property (strong, nonatomic) IBOutlet UISlider *slider400;
@property (strong, nonatomic) IBOutlet UISlider *slider1k;
@property (strong, nonatomic) IBOutlet UISlider *slider2k;
@property (strong, nonatomic) IBOutlet UISlider *slider6k;
@property Globals *g;

@end

NS_ASSUME_NONNULL_END
