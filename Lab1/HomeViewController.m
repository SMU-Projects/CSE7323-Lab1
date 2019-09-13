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
@property (strong, nonatomic) IBOutlet MyTableViewClass *tableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation HomeViewController

/*!
 @brief Gets logo from logoImageView.
 */
-(UIImage*)getLogo{
    return self.logoButton.currentImage;
}

///*!
//    @brief Method call that occurs when the view has loaded.
// */
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}

/*!
 @brief Method call that occurs when the view has appeared. Loads MyTableViewClass object.
 */
-(void)viewDidAppear:(BOOL)animated{
    //    self.tableView = [[MyTableViewClass alloc] init];
    //
    //
    //    self.tableView.delegate = self;
    //    self.tableView.dataSource = self;
}

/*!
 @brief Method call that occurs when segmentedControl has a change in state. Changes the view to either Table or Collection.
 */
- (IBAction)segmentedControlAction:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0){
        NSLog(@"Segmented Control is Table View");
    } else {
        NSLog(@"Segmented Control is Connection View");
    }
    
}




@end


/*!
 
 THIS IS AN EXAMPLE PLEASE DELETE BEFORE TURN IN, WILL, MY MAN.
 @brief It converts temperature degrees from Fahrenheit to Celsius scale.
 
 @discussion This method accepts a float value representing the temperature in <b>Fahrenheit</b> scale and it converts it to the <i>Celsius</i> scale.
 
 To use it, simply call @c[self toCelsius: 50];
 
 @param  fromFahrenheit The input value representing the degrees in the Fahrenheit scale.
 
 @return float The degrees in the Celsius scale.
 */
