//
//  PlaylistTableViewCell.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/15/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlaylistTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumb;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *artist;


@end

NS_ASSUME_NONNULL_END
