//
//  PHP+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHP+GRMustache.h"

@implementation PHP (GRMustache)

- (NSNumber*)hasExtensions {
    return [NSNumber numberWithBool:([[self extensions] count] > 0)];
}

- (NSNumber*)hasIncludePath {
    return [NSNumber numberWithBool:([[self include_path] count] > 0)];
}

- (NSNumber*)precision {
    return ([[self primitiveValueForKey:@"precision"] intValue] > 0)?[self primitiveValueForKey:@"precision"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)serialize_precision {
    return ([[self primitiveValueForKey:@"serialize_precision"] intValue] > 0)?[self primitiveValueForKey:@"serialize_precision"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)realpath_cache_ttl {
    return ([[self primitiveValueForKey:@"realpath_cache_ttl"] intValue] > 0)?[self primitiveValueForKey:@"realpath_cache_ttl"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)default_socket_timeout {
    return ([[self primitiveValueForKey:@"default_socket_timeout"] intValue] > 0)?[self primitiveValueForKey:@"default_socket_timeout"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)max_execution_time {
    return ([[self primitiveValueForKey:@"max_execution_time"] intValue] > 0)?[self primitiveValueForKey:@"max_execution_time"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)max_input_time {
    return ([[self primitiveValueForKey:@"max_input_time"] intValue] > 0)?[self primitiveValueForKey:@"max_input_time"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)max_input_nesting_level {
    return ([[self primitiveValueForKey:@"max_input_nesting_level"] intValue] > 0)?[self primitiveValueForKey:@"max_input_nesting_level"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)log_errors_max_len {
    return ([[self primitiveValueForKey:@"log_errors_max_len"] intValue] > 0)?[self primitiveValueForKey:@"log_errors_max_len"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)date_default_latitude {
    return ([[self primitiveValueForKey:@"date_default_latitude"] floatValue] > 0)?[self primitiveValueForKey:@"date_default_latitude"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)date_default_longitude {
    return ([[self primitiveValueForKey:@"date_default_longitude"] floatValue] > 0)?[self primitiveValueForKey:@"date_default_longitude"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)date_sunrise_zenith {
    return ([[self primitiveValueForKey:@"date_sunrise_zenith"] floatValue] > 0)?[self primitiveValueForKey:@"date_sunrise_zenith"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)date_sunset_zenith {
    return ([[self primitiveValueForKey:@"date_sunset_zenith"] floatValue] > 0)?[self primitiveValueForKey:@"date_sunset_zenith"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)y2k_compliance {
    return [NSNumber numberWithBool:[[self primitiveValueForKey:@"y2k_compliance"] boolValue]];
}

- (NSString*)dir_separator {
    return @";";
}

@end
