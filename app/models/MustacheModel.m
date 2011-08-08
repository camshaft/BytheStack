//
//  MustacheModel.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/6/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "MustacheModel.h"

@implementation MustacheModel

- (void)saveConfigToFile:(NSString*)path {
    NSError *error;
    
    NSString * configString = [GRMustacheTemplate renderObject:self fromResource:[[self class] mustacheFileName] withExtension:@"mustache" bundle:[NSBundle mainBundle] error:&error];
    
    if (error) {
        NSLog(@"%@",[error description]);
    }
    else {
        
    }
    
    NSLog(@"%@",configString);
}

@end
