//
//  Artist.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/6/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject
@property NSString *artist;
@property NSString *artistID;
@property NSMutableArray *albumList;
- (void)addAlbum:(Album *)album;
@end

NS_ASSUME_NONNULL_END
