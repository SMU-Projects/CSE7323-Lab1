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

-(DataModel*)myDataModel{
    
    if(!_myDataModel)
        _myDataModel =[DataModel sharedInstance];
    
    return _myDataModel;
}

-(void) viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return [self.myDataModel getDataObjectsSize];
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
        NSString *tableString = @"TableViewCell";
        TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableString];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:tableString owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        NSString* tempTitle = [[self.myDataModel getDataObjectWithNumber:indexPath.row] title];
        NSString* tempInfo = [[self.myDataModel getDataObjectWithNumber:indexPath.row] info];
        
        
        
        cell.title.text = tempTitle;
        cell.info.text = tempInfo;
        cell.date.text = [[self.myDataModel getDataObjectWithNumber:indexPath.row] date];
        cell.image.image = [[self.myDataModel getDataObjectWithNumber:indexPath.row] image];
        cell.completion.image = [[self.myDataModel getDataObjectWithNumber:indexPath.row] completion];
        
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
