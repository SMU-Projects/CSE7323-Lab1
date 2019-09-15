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

@property (strong, nonatomic) DataModel* myDataModel;

@end

@implementation NewDataView

/*!
    @brief declares myDataModel as a shared instance.
 */
-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel = [DataModel sharedInstance];
    
    return _myDataModel;
}

/*!
    @brief Method call that occurs after view has loaded. Assigns delegates.
 */
- (void)viewDidLoad{
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    self.infoTextField.delegate = self;
}

/*!
    @brief Method call that occurs when user presses the textField return key. Resigns the keyboard.
 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}

/*!
    @brief Method call that occurs when the stepper action has occured. Increments stepperLabel.text.
 */
- (IBAction)importanceSteppertepperAction:(id)sender {
    self.stepperLabel.text = [@([self.importanceStepper value]) stringValue];
}

/*!
    @brief Method call that occurs when the button action has occured. Before creating a new cell, there is first a check to see if the user has entered a name for the cell.
 */
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
        image = [UIImage imageNamed:@"Derp0"];
    }
    
    DataObject* object = [[DataObject alloc] init:name :info :date :importance :image];
    
    [self.myDataModel addNewDataObject:object];
    [self.myDataModel sortDataObjects];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
