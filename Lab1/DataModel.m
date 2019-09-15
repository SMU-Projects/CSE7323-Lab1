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

-(NSMutableArray*)dataObjects{
    if(!_dataObjects){
        
        DataObject* object1 = [[DataObject alloc] init:@"HW: Lab 1"
                                                      :@"Mobile Sensing"
                                                      :[NSDate date]
                                                      :@(10) ];
        
        DataObject* object2 = [[DataObject alloc] init:@"HW: Watch Video Lecture"
                                                      :@"Computer Architecture; This assignment is due Tuesday"
                                                      :[NSDate date]
                                                      :@(2) ];
        
        DataObject* object3 = [[DataObject alloc] init:@"I miss you Roger Wong"
                                                      :@""
                                                      :[NSDate date]
                                                      :@(1) ];
        
        [object1 isCompleted];
        object3.image = [UIImage imageNamed:@"Logo"];
        
    
        _dataObjects = [[NSMutableArray alloc] init];
        [_dataObjects addObject:object1];
        [_dataObjects addObject:object2];
        [_dataObjects addObject:object3];
    }
    return _dataObjects;
}

-(NSInteger)getDataObjectsSize{
    NSNumber* size = @(self.dataObjects.count);
    return [size integerValue];
}

-(DataObject*)getDataObjectWithNumber:(NSInteger)index
{
    return (self.dataObjects[index]);
}

-(void)addNewDataObject:(DataObject*)object{
    [_dataObjects addObject:object];
}


@end
