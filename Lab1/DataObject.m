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
- (instancetype)init:(NSString*)name
                    :(NSString*)info
                    :(NSDate*)date
                    :(NSNumber*)importance
                    :(UIImage*)image{
    
    self.name = name;
    self.info = info;
    self.date = date;
    self.importance = importance;
    self.image = image;
    
    return self;
}

/*!
    @brief Getter for title property.
 */
-(NSString*)name{
    if(!_name){
        _name = @"Error Name";
    }
    return _name;
}

/*!
    @brief Getter for info property.
 */
-(NSString*)info{
    if(!_info){
        _info = @"Error Info";
    }
    return _info;
}

/*!
    @brief Getter for dateTime property as a NSString.
 */
-(NSDate*)date{
    if(!_date){
        _date = [NSDate date];
    }
    return _date;
}

/*!
    @brief Getter for image property.
 */
-(UIImage*)image{
    return _image;
}

/*!
    @brief Getter for completion property as an image.
 */
-(BOOL)completion{
    if(!_completion){
        _completion = NO;
    }
    return _completion;
}

/*!
    @brief Getter for importance property.
 */
-(NSNumber*)importance{
    if(!_importance){
        _importance = @(0);
    }
    return _importance;
}

-(UIImage*)getCompletionImage{
    if(self.completion == YES)
    {
        return [UIImage imageNamed:@"completed_yes"];
    }
    return [UIImage imageNamed:@"completed_no"];
}

-(NSString*)getFormatedDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:self.date];
}

@end
