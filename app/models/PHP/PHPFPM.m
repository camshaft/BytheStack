//
//  PHPFPM.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHPFPM.h"
#import "PHP.h"
#import "PHPFPMPool.h"


@implementation PHPFPM
@dynamic error_log;
@dynamic emergency_restart_interval;
@dynamic process_control_timeout;
@dynamic daemonize;
@dynamic emergency_restart_threshold;
@dynamic log_level;
@dynamic pid;
@dynamic php;
@dynamic pools;

+ (NSString*)mustacheFileName {
    return @"php-fpm.conf";
}

@end
