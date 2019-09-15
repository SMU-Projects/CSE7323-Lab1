//
//  TableViewCell.h
//  Lab1
//
//  Created by Will Lacey on 9/14/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *dataTime;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *completion;

@end

NS_ASSUME_NONNULL_END
