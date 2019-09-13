//
//  DataModel.h
//  Lab1
//
//  Created by Will Lacey on 9/13/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataObject.h"

@interface DataModel : NSObject

+(DataModel*) sharedInstance;

-(NSInteger)getDataObjectsSize;

-(DataObject*)getDataObjectWithNumber:(NSInteger)index;

@end
