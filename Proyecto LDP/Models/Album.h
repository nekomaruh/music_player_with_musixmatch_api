//
//  Album.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/6/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Music.h"

NS_ASSUME_NONNULL_BEGIN

@interface Album : NSObject

@property NSString *album;
@property NSString *artist;
@property NSString *artistID;
@property UIImage *thumb;
@property NSMutableArray *musicList;
- (void) addMusic:(Music *)music;

@end

NS_ASSUME_NONNULL_END
