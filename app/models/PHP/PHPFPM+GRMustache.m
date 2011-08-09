//
//  PHPFPM+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHPFPM+GRMustache.h"

@implementation PHPFPM (GRMustache)

- (NSNumber*)emergency_restart_threshold {
    return ([[self primitiveValueForKey:@"emergency_restart_threshold"] intValue] > 0)?[self primitiveValueForKey:@"emergency_restart_threshold"]:[NSNumber numberWithBool:NO];
}

@end
