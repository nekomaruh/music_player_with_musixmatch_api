//
//  Album.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/6/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "Album.h"

@implementation Album

@synthesize album;
@synthesize thumb;
@synthesize artist;
@synthesize artistID;

- (void)addMusic:(Music *)music{
    if (_musicList==nil){
        _musicList = [[NSMutableArray alloc] init];
    }
    [_musicList addObject: music];
}

@end
