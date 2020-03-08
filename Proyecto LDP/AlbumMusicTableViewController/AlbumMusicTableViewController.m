//
//  AlbumMusicTableViewController.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 7/17/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "AlbumMusicTableViewController.h"
#import "AlbumMusicTableViewCell.h"

@interface AlbumMusicTableViewController ()

@end

@implementation AlbumMusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlbumMusicTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AlbumMusicTableViewCell class])];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb_2.jpeg"]];
    [self setBackgroundImage:tempImageView];
    
    self.title = @"Álbum de artista";
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - Table view data source

// Cambia la imagen de fondo al seleccionar una canción
- (void)setBackgroundImage:(UIImageView *)backgroundImage{
    [backgroundImage setFrame:self.tableView.frame];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    [backgroundImage setAlpha:0.3];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = backgroundImage.bounds;
    [backgroundImage addSubview:blurView];
    self.tableView.backgroundView = backgroundImage;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.musicList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumMusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AlbumMusicTableViewCell class]) forIndexPath:indexPath];
    
    Music *music = [self.musicList objectAtIndex:indexPath.row];
    cell.title.text = music.title;
    cell.artist.text = music.artist;
    cell.thumb.image = music.thumb;
    
    cell.thumb.layer.masksToBounds = YES;
    [cell.thumb.layer setCornerRadius:4.0f];
    [cell.thumb.layer setBorderWidth:0.5f];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
