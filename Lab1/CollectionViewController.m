//
//  CollectionViewController.m
//  Lab1
//
//  Created by Will Lacey on 9/14/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property (strong, nonatomic) DataModel* myDataModel;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

/*!
    @brief declares myDataModel as a shared instance.
 */
-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel =[DataModel sharedInstance];
    
    return _myDataModel;
}

/*!
    @brief Method call that occurs right before view has appeared. Reloads dataView.
 */
-(void)viewWillAppear:(BOOL)animated{
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

/*!
    @brief sets the size of cells.
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

/*!
    @brief Sets the number of sections in the tableView.
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


/*!
    @brief Returns the number of cells.
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.myDataModel getDataObjectsSize] + 1;
}

/*!
    @brief creates corresponding cell given the indexPath.row.
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [self.myDataModel getDataObjectsSize])
    {
        NSString *collectionString = @"CollectionViewCell";
        
        
        CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionString forIndexPath:indexPath];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:collectionString owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        DataObject* object = [self.myDataModel getDataObjectWithNumber:indexPath.row];
        cell.object = object;
        
        cell.name.text = object.name;
        cell.date.text = [object getFormatedDate];
        cell.completion.image = [object getCompletionImage];
        
        cell.layer.borderWidth=1.0f;
        
        return cell;
        
    } else {
        NSString *collectionString = @"NewCollectionViewCell";
        
        
        NewCollectionViewCell *cell = (NewCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionString forIndexPath:indexPath];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:collectionString owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label.textColor = [UIColor blueColor];
        
        cell.layer.borderWidth=1.0f;
        
        return cell;
    }
    
}

/*!
    @brief Method call before segue. If segue is to DataViewController, pass the DataObject.
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[DataViewController class]];
    
    if(isVC){
        NSLog(@"Collection View Controller Segue to Data View Controller Occuring");
        
        CollectionViewCell* cell = (CollectionViewCell*)sender;
        DataViewController *vc = [segue destinationViewController];
        
        vc.object = cell.object;
        
    }
}

@end
