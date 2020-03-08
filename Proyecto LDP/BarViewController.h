//
//  BarViewController.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 6/4/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Models/Music.h"
#import "Globals/Globals.h"

NS_ASSUME_NONNULL_BEGIN

@interface BarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *musicName;
@property Globals *g;
- (void) setBarMusic;
@end

NS_ASSUME_NONNULL_END
