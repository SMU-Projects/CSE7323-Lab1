//
//  LogoViewController.m
//  Lab1
//
//  Created by Will Lacey on 9/12/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "LogoViewController.h"

@interface LogoViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@end

@implementation LogoViewController

/*!
    @brief Method call that occurs right after view has loaded. Prepares zooming functionality.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView addSubview:self.logoImageView];
    self.scrollView.contentSize = self.logoImageView.image.size;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view.
}

/*!
    @brief Enables zooming functionality.
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.logoImageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
