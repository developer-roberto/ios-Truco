//
//  MarkerViewController.m
//  truco
//
//  Created by Roberto Oliveira on 18/05/2018.
//  Copyright © 2018 RobertoOliveira. All rights reserved.
//

#import "MarkerViewController.h"
#import "MarkerItemCollectionViewCell.h"

@interface MarkerViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView0;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markerConstraint0;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markerConstraint1;
@property (nonatomic) NSInteger score0;
@property (nonatomic) NSInteger score1;
@end

@implementation MarkerViewController

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        self.score0 = 0;
        self.score1 = 0;
        [self updateScores:true];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView0.dataSource = self;
    self.collectionView0.delegate = self;
    self.collectionView1.dataSource = self;
    self.collectionView1.delegate = self;
    self.score0 = 0;
    self.score1 = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.contentView.alpha = 0;
    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, 0.5, 0.5);
    [self updateScores:false];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionView0 reloadData];
    [self.collectionView1 reloadData];
    [UIView animateWithDuration:0.75 animations:^{
        self.contentView.alpha = 1;
        self.contentView.transform = CGAffineTransformIdentity;
    }];
}

-(void)updateScores:(BOOL)animated {
    CGFloat height = self.collectionView0.frame.size.height/12;
    
    self.markerConstraint0.constant = (self.score0 * height) + (height/2) - 13;
    self.markerConstraint1.constant = (self.score1 * height) + (height/2) - 13;
    NSTimeInterval duration = animated ? 1.0 : 0.0;
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //
    }];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.collectionView0) {
        self.score0 = indexPath.item;
    } else {
        self.score1 = indexPath.item;
    }
    [self updateScores:true];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.collectionView0) {
        MarkerItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"nos" forIndexPath:indexPath];
        cell.lblTitle.text = [NSString stringWithFormat:@"%li", (long)indexPath.item];
        return cell;
    } else {
        MarkerItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"eles" forIndexPath:indexPath];
        cell.lblTitle.text = [NSString stringWithFormat:@"%li", (long)indexPath.item];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height/12);
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}




@end












