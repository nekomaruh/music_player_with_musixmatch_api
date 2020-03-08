//
//  Music.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/3/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Music : NSObject

@property NSString *title;
@property NSString *artist;
@property NSString *genre;
@property NSString *album;
@property NSString *path;
@property UIImage *thumb;
@property NSString *duration;
@property NSString *ID;
@property NSString *lyrics;
@property NSString *artistID;

@end

NS_ASSUME_NONNULL_END
