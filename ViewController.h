//
//  ViewController.h
//  PanoViewer
//
//  Created by Ricky Kirkendall on 4/5/16.
//  Copyright © 2016 CodeLab. All rights reserved.
//

#import "GCSPanoramaView.h"

#import <UIKit/UIKit.h>

static const CGFloat kPanoViewHeight = 250;
static const CGFloat kMargin = 16;
@interface ViewController : UIViewController

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *sceneName;

@property (weak, nonatomic) IBOutlet UILabel *sceneLabel;

@end
