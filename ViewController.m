//
//  ViewController.m
//  PanoViewer
//
//  Created by Ricky Kirkendall on 4/5/16.
//  Copyright © 2016 CodeLab. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (nonatomic, strong) GCSPanoramaView *panoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _panoView = [[GCSPanoramaView alloc] init];
    _panoView.enableFullscreenButton = YES;
    _panoView.enableCardboardButton = YES;
    if (!self.imageName) {
        self.imageName = @"";
    }
    [_panoView loadImage:[UIImage imageNamed:self.imageName]
                  ofType:kGCSPanoramaImageTypeStereoOverUnder];
    [self.view addSubview:_panoView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.sceneLabel.text = self.sceneName;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"Getting called");
    
    self.panoView.frame = CGRectMake(kMargin,
                                 CGRectGetMaxY(self.sceneLabel.frame) + kMargin,
                                 CGRectGetWidth(self.view.bounds) - 2 * kMargin,
                                 kPanoViewHeight);
    
}

- (void)setFrameForView:(UIView *)view belowView:(UIView *)topView margin:(CGFloat)margin {
    CGSize size =
    [view sizeThatFits:CGSizeMake(CGRectGetWidth(self.view.bounds) - 2 * kMargin, CGFLOAT_MAX)];
    view.frame = CGRectMake(kMargin, CGRectGetMaxY(topView.frame) + margin, size.width, size.height);
}




@end
