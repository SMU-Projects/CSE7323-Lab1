//
//  CollectionViewCell.h
//  Lab1
//
//  Created by Will Lacey on 9/14/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *completion;

@property (weak, nonatomic) IBOutlet DataObject *object;

@end

NS_ASSUME_NONNULL_END
