//
//  DataModel.m
//  Lab1
//
//  Created by Will Lacey on 9/13/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "DataModel.h"

@interface DataModel ()

@property (strong, nonatomic) NSMutableArray* dataObjects;

@end

@implementation DataModel

/*!
    @brief Allows for the DataModel to be shared by various classes without creating another instance.
 */
+(DataModel*)sharedInstance{
    static DataModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[DataModel alloc] init];
    });
    
    return _sharedInstance;
}

/*!
    @brief Getter for dataObjects.
 */
-(NSMutableArray*)dataObjects{
    if(!_dataObjects){
        
        DataObject* object1 = [[DataObject alloc] init:@"HW: Lab 1"
                                                      :@"Mobile Sensing Lab: Sink or Swim... Honestly, I ain't tryin' to sink here."
                                                      :[NSDate date]
                                                      :@(0)
                                                      :[UIImage imageNamed:@"Derp0"]];
        
        DataObject* object2 = [[DataObject alloc] init:@"HW: Watch Video Lecture"
                                                      :@"Computer Architecture; This assignment is due Tuesday and holy wow I wish it was due later because I don't have time for this stuff."
                                                      :[NSDate date]
                                                      :@(0)
                                                      :[UIImage imageNamed:@"Derp0"]];
        
        DataObject* object3 = [[DataObject alloc] init:@"I miss you Roger Wong"
                                                      :@"I'll never forget you pal..."
                                                      :[NSDate date]
                                                      :@(0)
                                                      :[UIImage imageNamed:@"Logo"]];
        
        _dataObjects = [[NSMutableArray alloc] init];
        [_dataObjects addObject:object1];
        [_dataObjects addObject:object2];
        [_dataObjects addObject:object3];
    }
    return _dataObjects;
}

/*!
    @brief gets the size of dataObjects as an NSInteger.
 */
-(NSInteger)getDataObjectsSize{
    NSNumber* size = @(self.dataObjects.count);
    return [size integerValue];
}

/*!
    @brief gets a reference to a dataObject within dataObjects by using an NSinteger index.
 */
-(DataObject*)getDataObjectWithNumber:(NSInteger)index
{
    return (self.dataObjects[index]);
}

/*!
    @brief adds a new dataObject to the NSMutableArray dataObjects.
 */
-(void)addNewDataObject:(DataObject*)object{
    [self.dataObjects addObject:object];
}

/*!
    @brief sorts the NSMutableArray dataObjects. First sorts by DataObject.completion and then by DataObject.importance.
 */
-(void)sortDataObjects{
    // This isn't really great practice... but a selection sort is just so easy to write...
    for (int i=0; i < self.dataObjects.count-1; i++) {
        int swapIndex = i;
        for(int j=i+1; j < self.dataObjects.count; j++ ){
            if (![self.dataObjects[swapIndex] completion]){
                if([self.dataObjects[j] completion]){
                    swapIndex = j;
                } else if([self.dataObjects[j] importance] > [self.dataObjects[swapIndex] importance]){
                    swapIndex = j;
                }
            }
        }
        DataObject* temp = self.dataObjects[i];
        self.dataObjects[i] = self.dataObjects[swapIndex];
        self.dataObjects[swapIndex] = temp;
    }
}

@end
