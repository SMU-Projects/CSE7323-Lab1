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
                    :(NSString*)info
                    :(NSDate*)dateTime
//                    :(UIImage*)image
//                    :(UIColor*)color
                    :(NSNumber*)importance;{
    
    self.title = title;
    self.info = info;
    self.dateTime = dateTime;
//    self.image = image;
//    self.color = color
    self.importance = importance;
    
    return self;
}

/*!
    @brief Getter for title property.
 */
-(NSString*)title{
    if(!_title){
        _title = @"Error Title";
    }
    return _title;
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
-(NSString*)dateTime{
    if(!_dateTime){
        _dateTime = [NSDate date];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormatter stringFromDate:_dateTime];
}

/*!
    @brief Getter for image property.
 */
-(UIImage*)image{
    if(!_image){
        _image = [UIImage imageNamed:@"Derp"];
    }
    return _image;
}

/*!
    @brief Getter for completion property as an image.
 */
-(UIImage*)completion{
    if(!_completion){
        _completion = @(0);
    }
    
    if([_completion isEqual:(@(0))])
    {
        return [UIImage imageNamed:@"Logo"];;
    }
    return [UIImage imageNamed:@"Derp"];;
}

///*!
// @brief Getter for color property.
// */
//-(UIColor*)color{
//    if(!_color){
//        _color = [UIColor blueColor];
//    }
//    return _color;
//}

/*!
    @brief Getter for importance property.
 */
-(NSNumber*)importance{
    if(!_importance){
        _importance = @(0);
    }
    return _importance;
}

@end
