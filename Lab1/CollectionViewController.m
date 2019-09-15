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

-(void)viewWillAppear:(BOOL)animated{
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.myDataModel getDataObjectsSize] + 1;
}

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
