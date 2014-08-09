//
//  Logger.h
//  Callbacks
//
//  Created by Richard on 14-4-2.
//  Copyright (c) 2014年 com.Richard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject{
    NSMutableData *incomingData;
}
- (void)sayOuch:(NSTimer *)t;
@end
