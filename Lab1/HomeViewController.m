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



/*!
    @brief Method call that occurs when the view has loaded.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:(UITableViewCell.self) forCellReuseIdentifier:(@"cell")];
}

//#pragma mark - Table View Functions
//
//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//
//    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:(@"cell")];
//    cell.textLabel.text = @"hello";
//    return cell;
//}
//
//- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 3;
//}
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

//- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}

//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
