//
//  PlaylistTableViewController.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/15/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "PlaylistTableViewController.h"
#import "PlaylistTableViewCell.h"
#import "../AlbumMusicTableViewController/AlbumMusicTableViewController.h"



@interface PlaylistTableViewController ()
@end

@implementation PlaylistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PlaylistTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PlaylistTableViewCell class])];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb_2.jpeg"]];
    [self setBackgroundImage:tempImageView];
    
    if(_albumList==nil){
        globals = [Globals singleton];
        _albumList = globals.gblDataBase.albumList;
    }
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    

    
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

// Numero de columnas de la tabla
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Tamaño de la tabla
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _albumList.count;
}

// Crea la celda para cada fila y con sus respectivos atributos
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlaylistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PlaylistTableViewCell class]) forIndexPath:indexPath];
    
    Album *album = [_albumList objectAtIndex:indexPath.row];
    cell.name.text = album.album;
    cell.artist.text = album.artist;
    cell.thumb.image = album.thumb;
    cell.thumb.layer.masksToBounds = YES;
    [cell.thumb.layer setCornerRadius:4.0f];
    [cell.thumb.layer setBorderWidth:0.5f];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


// Ancho de la fila
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

// Se ejecuta cuando se selecciona un item de la tabla
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    
    [self setBackgroundImage:[[UIImageView alloc] initWithImage:music.thumb]];
    [globals playMusic:music];
     */
    
    Album *album = [_albumList objectAtIndex:indexPath.row];
    
    
    AlbumMusicTableViewController *view = [[AlbumMusicTableViewController alloc]init];
    view.musicList = album.musicList;
    [self.navigationController pushViewController:view animated:YES];
     
     
    
    for( Music *mus in album.musicList){
        NSLog(@"%@", mus.title);
    }
    
    
}

// Se ejecuta cuando se rota la pantalla
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        
    }];
    
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
