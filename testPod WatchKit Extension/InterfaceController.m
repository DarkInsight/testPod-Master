//
//  InterfaceController.m
//  testPod WatchKit Extension
//
//  Created by Thomas Tan on 23/3/15.
//  Copyright (c) 2015 WeesWares Pte. Ltd. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self testWS];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Implementation

- (void)testWS
{
    NSString *urlStr = @"http://cag-production-917908093.ap-southeast-1.elb.amazonaws.com/CAG_WS/search_flight_by_flightno?flightno=FD359&flow=1&period=0";
        
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:urlStr
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             NSLog(@"JSON: %@", responseObject);
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"Error: %@", error);
             
         }];
}

@end



