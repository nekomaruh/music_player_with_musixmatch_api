//
//  Globals.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/3/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Database.h"
#import <AVFoundation/AVFoundation.h>
#import "../Models/Music.h"



// some_file.h
#if !defined SOME_FILE_H
#define SOME_FILE_H

/* Clase Global */
@interface Globals : NSObject{
}

@property(nonatomic) Database *gblDataBase;
@property(nonatomic) MPMusicPlayerController *gblPlayerController;
@property(nonatomic) Music *currentMusic;


- (void) playMusic: (Music*) music;
- (void) manageEqualizer: (int) band;
+ (Globals *) singleton;

@end

#endif

