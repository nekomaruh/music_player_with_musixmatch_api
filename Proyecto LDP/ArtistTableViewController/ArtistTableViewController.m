//
//  ArtistTableViewController.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 7/20/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "ArtistTableViewCell.h"
#import "../Globals/Globals.h"
#import "../PlayList/PlaylistTableViewController.h"

@interface ArtistTableViewController ()

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ArtistTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ArtistTableViewCell class])];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb_2.jpeg"]];
    [self setBackgroundImage:tempImageView];
    
    self.title = @"Artists";
    
    globals = [Globals singleton];
    artistList = globals.gblDataBase.artistList;
}

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

    return globals.gblDataBase.artistList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ArtistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ArtistTableViewCell class]) forIndexPath:indexPath];
    
    Album *album = [artistList objectAtIndex:indexPath.row];
    cell.artist.text = album.artist;
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Album *artist = [artistList objectAtIndex:indexPath.row];
    
    NSMutableArray *albums = globals.gblDataBase.albumList;
    NSMutableArray *albumsForArtist = [[NSMutableArray alloc] init];
    
    for(Album *a in albums){
        if(a.artist == artist.artist){
            [albumsForArtist addObject:a];
            NSLog(@"%@", a.album);
        }
    }
    
     PlaylistTableViewController *view = [[PlaylistTableViewController alloc]init];
    
    view.albumList = albumsForArtist;
    view.title = @"Álbumes del artista";
    
    [self.navigationController pushViewController:view animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
