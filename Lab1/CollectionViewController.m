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

-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel =[DataModel sharedInstance];
    
    return _myDataModel;
}

- (void)viewDidAppear:(BOOL)animated{
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
        return [self.myDataModel getDataObjectsSize];
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
        NSString *collectionString = @"CollectionViewCell";
        
        
        CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionString forIndexPath:indexPath];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:collectionString owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.title.text = [[self.myDataModel getDataObjectWithNumber:indexPath.row] title];
        cell.date.text = [[self.myDataModel getDataObjectWithNumber:indexPath.row] date];
        cell.completion.image = [[self.myDataModel getDataObjectWithNumber:indexPath.row] completion];
        
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

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
