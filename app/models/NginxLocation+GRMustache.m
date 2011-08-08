//
//  NginxLocation+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "NginxLocation+GRMustache.h"

@implementation NginxLocation (GRMustache)

- (NSNumber*)hasTryFiles {
    return [NSNumber numberWithBool:([[self try_files] count] > 0)];
}

- (NSNumber*)hasLimitExcept {
    return [NSNumber numberWithBool:([[self limit_except] count] > 0)];
}

@end
