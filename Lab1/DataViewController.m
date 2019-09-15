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
//@property (weak, nonatomic) IBOutlet UILabel *title;
//@property (weak, nonatomic) IBOutlet UIImageView *image;
//@property (weak, nonatomic) IBOutlet UILabel *date;
//@property (weak, nonatomic) IBOutlet UILabel *info;
//@property (weak, nonatomic) IBOutlet UILabel *completionLabel;
//@property (weak, nonatomic) IBOutlet UISwitch *completionSwitch;

@end

@implementation DataViewController

-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel =[DataModel sharedInstance];
    
    return _myDataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
