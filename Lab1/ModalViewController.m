//
//  ModalViewController.m
//  Lab1
//
//  Created by Will Lacey on 9/14/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation ModalViewController

/*!
    @brief Method call that occurs when the slider has updated. Changes font size of sliderLabel.
 */
- (IBAction)sliderAction:(id)sender {
    NSNumber* value = @((50 * self.slider.value) + 0);
    [self.sliderLabel setFont:[UIFont systemFontOfSize:value.floatValue]];
}

/*!
    @brief Method call that occurs when the view has loaded.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber* value = @(0);
    self.slider.value = value.floatValue;
    [self.sliderLabel setFont:[UIFont systemFontOfSize:value.doubleValue]];

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                      target:self
                                                    selector:@selector(changeViewBackgroundColor)
                                                    userInfo:nil
                                                     repeats:YES];
}

-(void)changeViewBackgroundColor{
    if ([self.view.backgroundColor isEqual:[UIColor lightGrayColor]]){
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    
}

/*!
    @brief Dismisses ModalViewController and returns to original view.
 */
- (IBAction)dismissButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
