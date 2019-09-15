//
//  NewDataView.m
//  Lab1
//
//  Created by Will Lacey on 9/15/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "NewDataView.h"

@interface NewDataView ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *infoTextField;
@property (weak, nonatomic) IBOutlet UIStepper *importanceStepper;
@property (weak, nonatomic) IBOutlet UILabel *stepperValue;
@property (weak, nonatomic) IBOutlet UISwitch *coolSwitch;
@property (weak, nonatomic) IBOutlet UIButton *createCellButton;

@property (strong, nonatomic) DataModel* myDataModel;

@end

@implementation NewDataView

-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel = [DataModel sharedInstance];
    
    return _myDataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)newCellButtonAction:(id)sender {
    
    DataObject* object = [[DataObject alloc] init:@"Test"
                                                  :@"Test"
                                                  :[NSDate date]
                                                  :@(1) ];
    
    [self.myDataModel addNewDataObject:object];
//    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
