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
@property (weak, nonatomic) IBOutlet UIImageView *animationImage;

@property (strong, nonatomic) IBOutlet NSTimer* timer;
@property (strong, nonatomic) IBOutlet NSNumber *indexPointer;
@property (strong, nonatomic) IBOutlet NSNumber *indexPointerDirection;

@end

@implementation ModalViewController

/*!
    @brief Method call that occurs when the view has loaded. Starts timer and sets labels.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber* value = @(0);
    self.slider.value = value.floatValue;
    [self.sliderLabel setFont:[UIFont systemFontOfSize:value.doubleValue]];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(playAnimation)
                                                userInfo:nil
                                                 repeats:YES];
}

/*!
    @brief getter for indexPointer property.
 */
-(NSNumber*)indexPointer{
    if(!_indexPointer){
        _indexPointer = @(0);
    }
    return _indexPointer;
}

/*!
    @brief getter for indexPointerDirection property.
 */
-(NSNumber*)indexPointerDirection{
    if(!_indexPointerDirection){
        _indexPointerDirection = @(1);
    }
    return _indexPointerDirection;
}

/*!
    @brief changes animationImage every timer interval. Plays an animation.
 */
-(void)playAnimation{
    int index = [self.indexPointer intValue];
    int direction = [self.indexPointerDirection intValue];
    
    switch (index) {
        case 0:
            self.animationImage.image = [UIImage imageNamed:@"Derp0"];
            index = index + direction;
            break;
        case 1:
            self.animationImage.image = [UIImage imageNamed:@"Derp1"];
            index = index + direction;
            break;
        case 2:
            self.animationImage.image = [UIImage imageNamed:@"Derp2"];
            index = index + direction;
            break;
        case 3:
            self.animationImage.image = [UIImage imageNamed:@"Derp3"];
            index = index + direction;
            break;
        case 4:
            self.animationImage.image = [UIImage imageNamed:@"Derp4"];
            direction = 1;
            index = index + direction;
            break;
        case 5:
            self.animationImage.image = [UIImage imageNamed:@"Derp5"];
            index = index + direction;
            break;
        case 6:
            self.animationImage.image = [UIImage imageNamed:@"Derp6"];
            index = index + direction;
            break;
        case 7:
            self.animationImage.image = [UIImage imageNamed:@"Derp7"];
            index = index + direction;
            break;
        case 8:
            self.animationImage.image = [UIImage imageNamed:@"Derp8"];
            index = index + direction;
            break;
        case 9:
            self.animationImage.image = [UIImage imageNamed:@"Derp9"];
            direction = -1;
            index = index + direction;
            break;
        default:
            self.animationImage.image = [UIImage imageNamed:@"Logo"];
            break;
    }
    self.indexPointer = @(index);
    self.indexPointerDirection = @(direction);
}

/*!
    @brief Method call that occurs when the slider has updated. Changes font size of sliderLabel.
 */
- (IBAction)sliderAction:(id)sender {
    NSNumber* value = @((50 * self.slider.value) + 0);
    [self.sliderLabel setFont:[UIFont systemFontOfSize:value.floatValue]];
}

/*!
    @brief Dismisses ModalViewController and returns to original view.
 */
- (IBAction)dismissButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.timer invalidate];
}

@end
