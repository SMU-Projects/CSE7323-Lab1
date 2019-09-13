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
        DataObject* object1 = [[DataObject alloc] init:@"Will1" :@1];
        DataObject* object2 = [[DataObject alloc] init:@"Will2" :@2];
        _dataObjects = [[NSMutableArray alloc] init];
        [_dataObjects addObject:object1];
        [_dataObjects addObject:object2];
        NSLog(@"DataModel has %zd elements in its mutable array", [self getDataObjectsSize ]);
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
