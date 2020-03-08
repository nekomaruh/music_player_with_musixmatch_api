//
//  DiscoverViewController.h
//  Proyecto LDP
//
//  Created by Johan Esteban Ordenes Galleguillos on 6/6/19.
//  Copyright © 2019 Johan Esteban Ordenes Galleguillos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverViewController : UIViewController
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) IBOutlet UIView *barView;


@end

NS_ASSUME_NONNULL_END
