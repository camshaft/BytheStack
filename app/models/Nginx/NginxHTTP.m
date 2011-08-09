//
//  NginxHTTP.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import "NginxHTTP.h"
#import "NginxServer.h"


@implementation NginxHTTP
@dynamic client_header_buffer_size;
@dynamic client_header_timeout;
@dynamic large_client_header_buffers;
@dynamic optimize_server_names;
@dynamic port;
@dynamic server_names_hash_bucket_size;
@dynamic server_names_hash_max_size;
@dynamic timer_resolution;
@dynamic underscores_in_headers;
@dynamic variables_hash_bucket_size;
@dynamic variables_hash_max_size;
@dynamic worker_processes;
@dynamic worker_rlimit_nofile;
@dynamic servers;

@end
