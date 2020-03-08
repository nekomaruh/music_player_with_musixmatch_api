//
//  Database.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/3/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Music.h"
#import "Album.h"
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Database : NSObject
@property NSMutableArray *musicList;
@property NSMutableArray *artistList;
@property NSMutableArray *albumList;
- (void) loadData;

@end

NS_ASSUME_NONNULL_END
