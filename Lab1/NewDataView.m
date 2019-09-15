//
//  NewDataView.m
//  Lab1
//
//  Created by Will Lacey on 9/15/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "NewDataView.h"

@interface NewDataView () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *infoTextField;
@property (weak, nonatomic) IBOutlet UIStepper *importanceStepper;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UISwitch *coolSwitch;
@property (weak, nonatomic) IBOutlet UIButton *createCellButton;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@property (strong, nonatomic) DataModel* myDataModel;

@end

@implementation NewDataView

-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel = [DataModel sharedInstance];
    
    return _myDataModel;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    self.infoTextField.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}

- (IBAction)didTapMainView:(id)sender {
//    [self.nameTextField resignFirstResponder];
//    [self.infoTextField resignFirstResponder];
}

- (IBAction)importanceSteppertepperAction:(id)sender {
    self.stepperLabel.text = [@([self.importanceStepper value]) stringValue];
}


- (IBAction)newCellButtonAction:(id)sender {
    NSString* name = [self.nameTextField text];
    if([name isEqual: @""]){
        self.nameLabel.text = @"Title   X";
        self.nameLabel.textColor = [UIColor redColor];
        return;
    }
    
    NSDate* date = [self.datePicker date];
    NSString* info = [self.infoTextField text];
    NSNumber* importance = @([self.importanceStepper value]);
    UIImage* image;
    if (self.coolSwitch.on){
        image = [UIImage imageNamed:@"Logo"];
    } else {
        image = [UIImage imageNamed:@"Derp"];
    }
    
    DataObject* object = [[DataObject alloc] init:name :info :date :importance :image];
    
    [self.myDataModel addNewDataObject:object];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
