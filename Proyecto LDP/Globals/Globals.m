//
//  Globals.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/3/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "Globals.h"

@implementation Globals{
    Globals *anotherSingle;
}

@synthesize gblDataBase;

- (void)playMusic:(Music *)music{
    _gblPlayerController = MPMusicPlayerApplicationController.applicationQueuePlayer;
    
    // Crea una query
    MPMediaQuery* query = [MPMediaQuery songsQuery];
    
    
    @try {
        // Filtra la query
        [query addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:music.ID forProperty:MPMediaEntityPropertyPersistentID comparisonType:MPMediaPredicateComparisonEqualTo]];
    }
    @catch (NSException *exception) {
        NSLog(@"Query no encontrada");
        // We'll just silently ignore the exception.
    }
    @finally {
        // Pasa la query al player controller
        [_gblPlayerController setQueueWithQuery:query];
        // Ejecuta las canciones filtradas por la query
        
        [_gblPlayerController play];
    }

}

- (void)manageEqualizer:(int)band{
    MPMusicPlayerController *mpc = _gblPlayerController;
    switch(band){
        case 50:
            break;
        case 150:
            break;
        case 400:
            break;
        case 1000:
            break;
        case 2000:
            break;
        case 6000:
            break;
    }
}


/* Crea o instancia la clase global */
+ (Globals *)singleton{
    static Globals *single = nil;
    @synchronized (self) {
        if(!single){
            single = [[Globals alloc] init];
        }
    }
    return single;
}


@end
