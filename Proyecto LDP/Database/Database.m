//
//  Database.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/3/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "Database.h"

@implementation Database

- (void)loadData{
    
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    
    NSArray *itemsFromGenericQuery = [everything items];
    _musicList = [[NSMutableArray alloc] init];
    _artistList = [[NSMutableArray alloc] init];
    _albumList = [[NSMutableArray alloc] init];
    
    
    for (MPMediaItem *song in itemsFromGenericQuery) {
        Music *music = [[Music alloc] init];
        music.ID = [song valueForProperty: MPMediaEntityPropertyPersistentID];
        music.title = [song valueForProperty: MPMediaItemPropertyTitle];
        music.artist = [song valueForProperty: MPMediaItemPropertyArtist];
        music.album = [song valueForProperty: MPMediaItemPropertyAlbumTitle];
        music.genre = [song valueForProperty: MPMediaItemPropertyGenre];
        music.artistID = [song valueForProperty:MPMediaItemPropertyArtistPersistentID];
        MPMediaItemArtwork *artwork = [song valueForProperty: MPMediaItemPropertyArtwork];
        if(artwork){
            music.thumb = [artwork imageWithSize: CGSizeMake (200, 200)];
        }else{
            music.thumb = [UIImage imageNamed:@"no_image.jpg"];
            music.artist = @"Desconocido - Lenguajes de programación";
        }
        //music.thumb = [song valueForProperty: MPMediaItemPropertyArtwork];
        music.duration = [song valueForProperty: MPMediaItemPropertyPlaybackDuration];
        NSURL *url = [song valueForProperty: MPMediaItemPropertyAssetURL];
        NSString *path = [NSString stringWithFormat:@"%@",[url absoluteString]];
        
        music.path = path;
        [_musicList addObject: music];
        
        bool albumExists = false;

        for(Album *album in _albumList){
            if([album.album isEqualToString:music.album]){
                [album addMusic:music];
                albumExists = true;
                break;
            }
        }
        if(!albumExists){
            Album *album = [[Album alloc] init];
            album.thumb = music.thumb;
            album.album = music.album;
            album.artist = music.artist;
            album.artistID = music.artistID;
            [album addMusic:music];
            [_albumList addObject:album];
        }
        
        //NSLog(music.thumb);
    }
    
    
   
    
    MPMediaQuery *artistQuery = [MPMediaQuery artistsQuery];
    artistQuery.groupingType = MPMediaGroupingAlbumArtist;
    NSArray *collections = [artistQuery collections];
    
    
    for(MPMediaItemCollection *art in collections) {
        MPMediaItem *i = [art.items objectAtIndex:0];
        Artist *artist = [[Artist alloc] init];
        artist.artist = [i valueForProperty: MPMediaItemPropertyArtist];
        artist.artistID = [i valueForProperty: MPMediaItemPropertyArtistPersistentID];
        [_artistList addObject:artist];
    }
    
    
    for( Album *alb in _albumList){
        NSLog(@"%@", alb.album);
    }
    for( Music *mus in _musicList){
        NSLog(@"%@", mus.path);
    }
    
    for(Artist *art in _artistList){
        NSLog(@"%@",art.artist);
    }
    

    
    
}



@end
