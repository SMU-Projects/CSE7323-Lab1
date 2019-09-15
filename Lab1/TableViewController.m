//
//  TableViewController.m
//  Lab1
//
//  Created by Will Lacey on 9/14/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) DataModel* myDataModel;

@end

@implementation TableViewController

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
    [self.tableView reloadData];
}

#pragma mark - Table view data source

/*!
    @brief sets the height of the cells.
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

/*!
    @brief Sets the number of sections in the tableView.
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

/*!
    @brief Returns the number of cells in a particular section.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return [self.myDataModel getDataObjectsSize];
    }
    return 1;
}

/*!
    @brief creates corresponding cell given the section or indexPath.row.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
        NSString *tableString = @"TableViewCell";
        TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableString];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableString owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        DataObject* object = [self.myDataModel getDataObjectWithNumber:indexPath.row];
        cell.object = object;
        
        cell.name.text = object.name;
        cell.info.text = object.info;
        cell.date.text = [object getFormatedDate];
        cell.image.image = object.image;
        cell.completion.image = [object getCompletionImage];
        
        return cell;
        
    } else {
        NSString *tableString = @"NewTableViewCell";
        NewTableViewCell *cell = (NewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableString];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableString owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
    
        cell.label.textColor = [UIColor blueColor];
        
        return cell;
    }
}

/*!
    @brief Method call before segue. If segue is to DataViewController, pass the DataObject.
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[DataViewController class]];
    
    if(isVC){
        NSLog(@"Table View Controller Segue to Data View Controller Occuring");
        
        TableViewCell* cell = (TableViewCell*)sender;
        DataViewController *vc = [segue destinationViewController];
        
        vc.object = cell.object;
        
    }
}

@end
