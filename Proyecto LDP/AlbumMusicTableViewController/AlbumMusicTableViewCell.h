//
//  AlbumMusicTableViewCell.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 7/17/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlbumMusicTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *artist;
@property (strong, nonatomic) IBOutlet UIImageView *thumb;


@end

NS_ASSUME_NONNULL_END
