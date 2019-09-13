//
//  MyTableViewClass.m
//  Lab1
//
//  Created by Will Lacey on 9/12/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "MyTableViewClass.h"

@interface MyTableViewClass ()

    @property (strong,nonatomic) DataModel* myDataModel;

@end

@implementation MyTableViewClass

- (instancetype)init{
    NSLog(@"Initializing TableView");
    [self numberOfSections];
    [self numberOfRowsInSection:1];
//    [self cellForRowAtIndexPath:(self.indexPathsForVisibleRows)];
    
    return self;
}

-(DataModel*)myDataModel{
    NSLog(@"TableViewClass has loaded that Data Model");
    if(!_myDataModel)
        _myDataModel = [DataModel sharedInstance];
    
    return  _myDataModel;
}

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    cell = [self dequeueReusableCellWithIdentifier:@"DataCell" forIndexPath:indexPath];
    cell.textLabel.text = @"Woll";
    
    return cell;
}

@end
