//
//  TableViewController.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/1/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Globals.h"
#include "Music.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController{
    Globals *globals;
    int numSongs;
    NSMutableArray *musicList;
}

- (void) setBackgroundImage: (UIImageView *) backgroundImage;
@end

NS_ASSUME_NONNULL_END
