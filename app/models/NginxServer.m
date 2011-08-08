//
//  NginxServer.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import "NginxServer.h"
#import "NginxHTTP.h"
#import "NginxLocation.h"


@implementation NginxServer
@dynamic access_log;
@dynamic client_header_buffer_size;
@dynamic client_header_timeout;
@dynamic error_log;
@dynamic isDefaultServer;
@dynamic large_client_header_buffers;
@dynamic optimize_server_names;
@dynamic port;
@dynamic server_name;
@dynamic try_files;
@dynamic underscores_in_headers;
@dynamic isPHPServer;
@dynamic locations;
@dynamic http;

+ (NSString*)mustacheFileName {
    return @"nginx.server";
}

@end
