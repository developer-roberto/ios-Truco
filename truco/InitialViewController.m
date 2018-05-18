//
//  InitialViewController.m
//  truco
//
//  Created by Roberto Oliveira on 18/05/2018.
//  Copyright © 2018 RobertoOliveira. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end

@implementation InitialViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.lblTitle.alpha = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.5 animations:^{
        self.lblTitle.alpha = 1.0;
    } completion:^(BOOL finished) {
        self.topConstraint.constant = 10;
        [UIView animateWithDuration:1.0 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self performSegueWithIdentifier:@"initialSegue" sender:nil];
        }];
        
    }];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent
//}


@end
