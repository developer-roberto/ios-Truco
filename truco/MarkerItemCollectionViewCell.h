//
//  MarkerItemCollectionViewCell.h
//  truco
//
//  Created by Roberto Oliveira on 18/05/2018.
//  Copyright © 2018 RobertoOliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarkerItemCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *markerView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end
