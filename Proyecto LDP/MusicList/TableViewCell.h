//
//  TableViewCell.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/1/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView_thumb;
@property (strong, nonatomic) IBOutlet UILabel *labelMusic;
@property (strong, nonatomic) IBOutlet UILabel *labelArtist;

@end

NS_ASSUME_NONNULL_END
