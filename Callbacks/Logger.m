//
//  Logger.m
//  Callbacks
//
//  Created by Richard on 14-4-2.
//  Copyright (c) 2014年 com.Richard. All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch!");
}

//收到一定字节数的数据后会被调用
- (void)connection:(NSURLConnection *)connection
  didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    
    //如果NSMutableData不存在，就创建它
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

//最后一部分数据被处理完之后会被调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all");
    NSString *string = [[NSString alloc] initWithData:incomingData
                                             encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
    
    //如果需要输出获取的全部数据，则可以取消下面代码的注释
    NSLog(@"the whole string is %@",string);
}

//获取数据失败时会被调用
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    NSLog(@"connection failed : %@", [error localizedDescription]);
    incomingData = nil;
}









@end
