//
//  PlaylistTableViewController.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/15/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Globals.h"
#include "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlaylistTableViewController : UITableViewController{
    Globals *globals;
    int numAlbums;
    
}
@property NSMutableArray *albumList;

- (void) setBackgroundImage: (UIImageView *) backgroundImage;

@end

NS_ASSUME_NONNULL_END
