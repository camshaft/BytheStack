//
//  NginxHTTP+GRMustache.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "NginxHTTP+GRMustache.h"

@implementation NginxHTTP (GRMustache)

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

- (NSNumber*)server_names_hash_bucket_size {
    return ([[self primitiveValueForKey:@"server_names_hash_bucket_size"] intValue] > 0)?[self primitiveValueForKey:@"server_names_hash_bucket_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)server_names_hash_max_size {
    return ([[self primitiveValueForKey:@"server_names_hash_max_size"] intValue] > 0)?[self primitiveValueForKey:@"server_names_hash_max_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)timer_resolution {
    return ([[self primitiveValueForKey:@"timer_resolution"] intValue] > 0)?[self primitiveValueForKey:@"timer_resolution"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)variables_hash_bucket_size {
    return ([[self primitiveValueForKey:@"variables_hash_bucket_size"] intValue] > 0)?[self primitiveValueForKey:@"variables_hash_bucket_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)variables_hash_max_size {
    return ([[self primitiveValueForKey:@"variables_hash_max_size"] intValue] > 0)?[self primitiveValueForKey:@"variables_hash_max_size"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)worker_processes {
    return ([[self primitiveValueForKey:@"worker_processes"] intValue] > 0)?[self primitiveValueForKey:@"worker_processes"]:[NSNumber numberWithBool:NO];
}

- (NSNumber*)worker_rlimit_nofile {
    return ([[self primitiveValueForKey:@"worker_rlimit_nofile"] intValue] > 0)?[self primitiveValueForKey:@"worker_rlimit_nofile"]:[NSNumber numberWithBool:NO];
}

@end
