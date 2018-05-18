//
//  MarkerItemCollectionViewCell.m
//  truco
//
//  Created by Roberto Oliveira on 18/05/2018.
//  Copyright © 2018 RobertoOliveira. All rights reserved.
//

#import "MarkerItemCollectionViewCell.h"

@implementation MarkerItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.markerView.backgroundColor = UIColor.clearColor;
    self.markerView.layer.borderWidth = 1.0;
    self.markerView.layer.borderColor = [UIColor.whiteColor colorWithAlphaComponent:(0.6)].CGColor;
    self.markerView.layer.cornerRadius = 5.0;
}

@end
