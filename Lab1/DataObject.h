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

@property (strong, nonatomic) IBOutlet NSString *name;
@property (strong, nonatomic) IBOutlet NSString *info;
@property (strong, nonatomic) IBOutlet NSDate *date;
@property (strong, nonatomic) IBOutlet UIImage *image;
@property (nonatomic, assign) BOOL completion;

//@property (strong, nonatomic) IBOutlet UIColor *color;
@property (strong, nonatomic) IBOutlet NSNumber *importance;



- (instancetype)init:(NSString*)name
                    :(NSString*)info
                    :(NSDate*)date
                    :(NSNumber*)importance
                    :(UIImage*)image;


-(NSString*)name;
-(NSString*)info;
-(NSDate*)date;
-(UIImage*)image;
-(BOOL)completion;
-(NSNumber*)importance;

-(UIImage*)getCompletionImage;
-(NSString*)getFormatedDate;


@end
