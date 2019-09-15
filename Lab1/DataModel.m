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
        
        DataObject* object1 = [[DataObject alloc] init:@"Title1"
                                                      :@"Information1"
                                                      :[NSDate date]
                                                      :@(1) ];
        
        DataObject* object2 = [[DataObject alloc] init:@"Title2"
                                                      :@"Information2"
                                                      :[NSDate date]
                                                      :@(1) ];
        
        DataObject* object3 = [[DataObject alloc] init:@"Title3"
                                                      :@"Information3"
                                                      :[NSDate date]
                                                      :@(1) ];
        
    
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


@end
