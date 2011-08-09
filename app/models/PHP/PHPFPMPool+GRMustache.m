//
//  PHPFPMPool+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHPFPMPool+GRMustache.h"

@implementation PHPFPMPool (GRMustache)

+ (NSString*)defaultsFile {
    return [[NSBundle mainBundle] pathForResource:@"php-fpm-defaults" ofType:@"plist"];
}

- (NSString*)listen {
    NSString * value = [self primitiveValueForKey:@"listen"];
    if (!value) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"listen"] objectForKey:@"default"];
    }
    return value;
}

- (NSString*)user {
    NSString * value = [self primitiveValueForKey:@"user"];
    if (!value) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"user"] objectForKey:@"default"];
    }
    return value;
}

- (NSString*)group {
    NSString * value = [self primitiveValueForKey:@"group"];
    if (!value) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"group"] objectForKey:@"default"];
    }
    return value;
}

- (NSString*)pm {
    NSString * value = [self primitiveValueForKey:@"pm"];
    if (!value) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"pm"] objectForKey:@"default"];
    }
    return value;
}

- (NSNumber*)pm_max_children {
    NSNumber * value = [self primitiveValueForKey:@"pm_max_children"];
    if ([value intValue] == 0) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"pm_max_children"] objectForKey:@"default"];
    }
    return value;
}

- (NSNumber*)pm_start_servers {
    NSNumber * value = [self primitiveValueForKey:@"pm_start_servers"];
    if ([value intValue] == 0) {
        value = [NSNumber numberWithBool:NO];
    }
    return value;
}

- (NSNumber*)pm_min_spare_servers {
    NSNumber * value = [self primitiveValueForKey:@"pm_min_spare_servers"];
    if ([value intValue] == 0) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"pm_min_spare_servers"] objectForKey:@"default"];
    }
    return value;
}

- (NSNumber*)pm_max_spare_servers {
    NSNumber * value = [self primitiveValueForKey:@"pm_max_spare_servers"];
    if ([value intValue] == 0) {
        NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:[[self class] defaultsFile]];
        value = [[defaults objectForKey:@"pm_max_spare_servers"] objectForKey:@"default"];
    }
    return value;
}

- (NSNumber*)listen_backlog {
    return ([[self primitiveValueForKey:@"listen_backlog"] intValue] > 0)?[self primitiveValueForKey:@"listen_backlog"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)pm_max_requests {
    return ([[self primitiveValueForKey:@"pm_max_requests"] intValue] > 0)?[self primitiveValueForKey:@"pm_max_requests"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)rlimit_core {
    return ([[self primitiveValueForKey:@"rlimit_core"] intValue] > 0)?[self primitiveValueForKey:@"rlimit_core"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)rlimit_files {
    return ([[self primitiveValueForKey:@"rlimit_files"] intValue] > 0)?[self primitiveValueForKey:@"rlimit_files"]:[NSNumber numberWithBool:NO];
}

- (NSString*)poolname {
    NSString * poolname = [self primitiveValueForKey:@"poolname"];
    
    if (!poolname) {
        [NSException raise:@"Invalid state" format:@"poolname needs to be set in order to render the conf file"];
    }
    
    return poolname;
}


@end
