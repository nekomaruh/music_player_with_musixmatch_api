//
//  EqualizerViewController.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 7/21/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "EqualizerViewController.h"


@interface EqualizerViewController ()

@end

@implementation EqualizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _g = [Globals singleton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)slider50:(id)sender {
    [_g manageEqualizer:50];
}

- (IBAction)slider150:(id)sender {
    [_g manageEqualizer:150];
}

- (IBAction)slider400:(id)sender {
    [_g manageEqualizer:400];
}

- (IBAction)slider1k:(id)sender {
    [_g manageEqualizer:1000];
}

- (IBAction)slider2k:(id)sender {
    [_g manageEqualizer:2000];
}

- (IBAction)slider6k:(id)sender {
    [_g manageEqualizer:6000];
}
@end
