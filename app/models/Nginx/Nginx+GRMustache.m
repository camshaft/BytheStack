//
//  Nginx+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "Nginx+GRMustache.h"

@implementation Nginx (GRMustache)

- (NSNumber*)hasTypes {
    return [NSNumber numberWithBool:([[self types] count] > 0)];
}

- (NSNumber*)hasErrorPage {
    return [NSNumber numberWithBool:([[self error_page] count] > 0)];
}

- (NSNumber*)client_body_buffer_size {
    return ([[self primitiveValueForKey:@"client_body_buffer_size"] intValue] > 0)?[self primitiveValueForKey:@"client_body_buffer_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)client_body_timeout {
    return ([[self primitiveValueForKey:@"client_body_timeout"] intValue] > 0)?[self primitiveValueForKey:@"client_body_timeout"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)client_max_body_size {
    return ([[self primitiveValueForKey:@"client_max_body_size"] intValue] > 0)?[self primitiveValueForKey:@"client_max_body_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)directio {
    return ([[self primitiveValueForKey:@"directio"] intValue] > 0)?[self primitiveValueForKey:@"directio"]:[NSNumber numberWithBool:NO];}

- (NSNumber*)keepalive_requests {
    return ([[self primitiveValueForKey:@"keepalive_requests"] intValue] > 0)?[self primitiveValueForKey:@"keepalive_requests"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)keepalive_timeout {
    return ([[self primitiveValueForKey:@"keepalive_timeout"] intValue] > 0)?[self primitiveValueForKey:@"keepalive_timeout"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)limit_rate {
    return ([[self primitiveValueForKey:@"limit_rate"] intValue] > 0)?[self primitiveValueForKey:@"limit_rate"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)limit_rate_after {
    return ([[self primitiveValueForKey:@"limit_rate_after"] intValue] > 0)?[self primitiveValueForKey:@"limit_rate_after"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)lingering_time {
    return ([[self primitiveValueForKey:@"lingering_time"] intValue] > 0)?[self primitiveValueForKey:@"lingering_time"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)lingering_timeout {
    return ([[self primitiveValueForKey:@"lingering_timeout"] intValue] > 0)?[self primitiveValueForKey:@"lingering_timeout"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)open_file_cache_min_uses {
    return ([[self primitiveValueForKey:@"open_file_cache_min_uses"] intValue] > 0)?[self primitiveValueForKey:@"open_file_cache_min_uses"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)open_file_cache_valid {
    return ([[self primitiveValueForKey:@"open_file_cache_valid"] intValue] > 0)?[self primitiveValueForKey:@"open_file_cache_valid"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)resolver_timeout {
    return ([[self primitiveValueForKey:@"resolver_timeout"] intValue] > 0)?[self primitiveValueForKey:@"resolver_timeout"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)send_timeout {
    return ([[self primitiveValueForKey:@"send_timeout"] intValue] > 0)?[self primitiveValueForKey:@"send_timeout"]:[NSNumber numberWithBool:NO];
}

@end
