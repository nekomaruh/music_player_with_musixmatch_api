//
//  TableViewController.m
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 4/1/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "Database.h"
#import "../BarViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];

    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thumb_2.jpeg"]];
    [self setBackgroundImage:tempImageView];
    
    self.title = @"Musica";
    
    globals = [Globals singleton];
    musicList = globals.gblDataBase.musicList;
}

// Cambia la imagen de fondo al seleccionar una canción
- (void)setBackgroundImage:(UIImageView *)backgroundImage{
    [backgroundImage setFrame:self.tableView.frame];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    [backgroundImage setAlpha:0.3];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
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
    return globals.gblDataBase.musicList.count;
}

// Crea la celda para cada fila y con sus respectivos atributos
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class]) forIndexPath:indexPath];
    
    Music *music = [musicList objectAtIndex:indexPath.row];
    cell.labelMusic.text = music.title;
    cell.labelArtist.text = music.artist;
    
    cell.imageView_thumb.image = music.thumb;
    cell.imageView_thumb.layer.masksToBounds = YES;
    //cell.imageView_thumb.layer.cornerRadius = 5;
    
    // border radius
    [cell.imageView_thumb.layer setCornerRadius:4.0f];
    
    // border
    [cell.imageView_thumb.layer setBorderColor:[UIColor grayColor].CGColor];
    [cell.imageView_thumb.layer setBorderWidth:0.5f];
    cell.backgroundColor = [UIColor clearColor];
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

// Ancho de la fila
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

// Se ejecuta cuando se selecciona un item de la tabla
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Music *music = [musicList objectAtIndex:indexPath.row];
    [self setBackgroundImage:[[UIImageView alloc] initWithImage:music.thumb]];
    globals.currentMusic = music;
    [globals playMusic:music];
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
