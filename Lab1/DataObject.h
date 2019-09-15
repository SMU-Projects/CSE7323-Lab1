//
//  DataObject.h
//  Lab1
//
//  Created by Will Lacey on 9/12/19.
//  Copyright © 2019 Will Lacey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DataObject : NSObject

@property (strong, nonatomic) IBOutlet NSString *title;
@property (strong, nonatomic) IBOutlet NSString *info;
@property (strong, nonatomic) IBOutlet NSDate *dateTime;
@property (strong, nonatomic) IBOutlet UIImage *image;
@property (strong, nonatomic) IBOutlet NSNumber *completion;

//@property (strong, nonatomic) IBOutlet UIColor *color;
@property (strong, nonatomic) IBOutlet NSNumber *importance;



- (instancetype)init:(NSString*)title
                    :(NSString*)info
                    :(NSDate*)dateTime
//                    :(UIImage*)image
//                    :(UIColor*)color
                    :(NSNumber*)importance;

-(NSString*)title;
-(NSString*)info;
-(NSString*)dateTime;
-(UIImage*)image;
-(UIImage*)completion;
//-(UIColor*)color;
-(NSNumber*)importance;


@end
