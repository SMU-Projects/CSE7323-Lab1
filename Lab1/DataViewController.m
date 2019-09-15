//
//  DataViewController.m
//  Lab1
//
//  Created by Will Lacey on 9/12/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@property (strong, nonatomic) DataModel* myDataModel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *completionLabel;
@property (weak, nonatomic) IBOutlet UISwitch *completionSwitch;

@end

@implementation DataViewController

-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel = [DataModel sharedInstance];
    
    return _myDataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.object.name;
    self.imageView.image = self.object.image;
    self.dateLabel.text = [self.object getFormatedDate];
    self.infoLabel.text = self.object.info;
    self.completionSwitch.on = self.object.completion;
}
- (IBAction)completionSwitchAction:(id)sender {
    self.object.completion = self.completionSwitch.on;
}

@end
