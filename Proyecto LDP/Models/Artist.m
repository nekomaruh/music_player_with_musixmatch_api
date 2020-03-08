//
//  Artist.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/6/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "Artist.h"

@implementation Artist
@synthesize artist;
@synthesize artistID;
- (void)addAlbum:(Album *)album{
    [_albumList addObject:album];
}
@end
