//
//  HomeViewController.m
//  Lab1
//
//  Created by Will Lacey on 9/12/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *logoButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) IBOutlet MyTableViewClass *tableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *fakeTableImage;

@end

@implementation HomeViewController

/*!
    @brief Gets logo from logoImageView.
 */
-(UIImage*)getLogo{
    return self.logoButton.currentImage;
}

/*!
    @brief Method call that occurs when segmentedControl has a change in state. Changes the view to either Table or Collection.
 */
- (IBAction)segmentedControlAction:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0){
        NSLog(@"Segmented Control is Table View");
        self.fakeTableImage.image = [UIImage imageNamed:@"TableImage"];
    } else {
        NSLog(@"Segmented Control is Connection View");
        self.fakeTableImage.image = [UIImage imageNamed:@"CollectionImage"];
    }
}

@end
