//
//  NginxServer+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "NginxServer+GRMustache.h"

@implementation NginxServer (GRMustache)

- (NSNumber*)hasTryFiles {
    return [NSNumber numberWithBool:([[self try_files] count] > 0)];
}

- (NSNumber*)client_header_buffer_size {
    return ([[self primitiveValueForKey:@"client_header_buffer_size"] intValue] > 0)?[self primitiveValueForKey:@"client_header_buffer_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)client_header_timeout {
    return ([[self primitiveValueForKey:@"client_header_timeout"] intValue] > 0)?[self primitiveValueForKey:@"client_header_timeout"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)large_client_header_buffers {
    return ([[self primitiveValueForKey:@"large_client_header_buffers"] intValue] > 0)?[self primitiveValueForKey:@"large_client_header_buffers"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)port {
    return ([[self primitiveValueForKey:@"port"] intValue] > 0)?[self primitiveValueForKey:@"port"]:[NSNumber numberWithBool:NO];
}

@end
