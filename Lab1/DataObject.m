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
                    :(NSDate*)date
//                    :(UIImage*)image
//                    :(UIColor*)color
                    :(NSNumber*)importance;{
    
    self.title = title;
    self.info = info;
    self.date = date;
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
-(NSString*)date{
    if(!_date){
        _date = [NSDate date];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormatter stringFromDate:_date];
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
-(UIImage*)completion{
    if(!_completion){
        _completion = @(0);
    }
    
    if([_completion intValue] == 1)
    {
        return [UIImage imageNamed:@"completed_yes"];;
    }
    return [UIImage imageNamed:@"completed_no"];;
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

-(void)isCompleted{
    self.completion = @(1);
}

@end
