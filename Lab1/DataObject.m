//
//  DataObject.m
//  Lab1
//
//  Created by Will Lacey on 9/12/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import "DataObject.h"

@implementation DataObject

/*!
    @brief Constructor for DataObject.
 */
- (instancetype)init:(NSString*)title
                    :(NSNumber*)importance{
    
    self.title = title;
    self.importance = importance;
    return self;
}

/*!
 @brief Getter for title property.
 */
-(NSString*)title{
    return _title;
}

/*!
 @brief Getter for importance property.
 */
-(NSNumber*)importance{
    return _importance;
}

@end

//@property (strong, nonatomic) NSDate *date;
////@property (strong, nonatomic) NSTime *time;
//@property (strong, nonatomic) NSString *title;
////@property (strong, nonatomic) NSString *color;
//@property (strong, nonatomic) NSString *info;
//@property (strong, nonatomic) NSNumber *importance;
//@property (strong, nonatomic) UIImage *image;
