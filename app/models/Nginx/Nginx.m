//
//  Nginx.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import "Nginx.h"


@implementation Nginx
@dynamic aio;
@dynamic chunked_transfer_encoding;
@dynamic client_body_buffer_size;
@dynamic client_body_in_file_only;
@dynamic client_body_in_single_buffer;
@dynamic client_body_temp_path;
@dynamic client_body_timeout;
@dynamic client_max_body_size;
@dynamic default_type;
@dynamic directio;
@dynamic error_page;
@dynamic if_modified_since;
@dynamic keepalive_disable;
@dynamic keepalive_requests;
@dynamic keepalive_timeout;
@dynamic limit_rate;
@dynamic limit_rate_after;
@dynamic lingering_close;
@dynamic lingering_time;
@dynamic lingering_timeout;
@dynamic log_not_found;
@dynamic log_subrequest;
@dynamic msie_padding;
@dynamic msie_refresh;
@dynamic open_file_cache;
@dynamic open_file_cache_errors;
@dynamic open_file_cache_min_uses;
@dynamic open_file_cache_valid;
@dynamic post_action;
@dynamic recursive_error_pages;
@dynamic reset_timedout_connection;
@dynamic resolver;
@dynamic resolver_timeout;
@dynamic root;
@dynamic satisfy;
@dynamic send_timeout;
@dynamic sendfile;
@dynamic server_name_in_redirect;
@dynamic server_tokens;
@dynamic tcp_nodelay;
@dynamic tcp_nopush;
@dynamic types;

- (id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context {
    
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        
        for (NSString *key in [self attributeKeys]) {
            id object = [self valueForKey:key];
            if ([object isKindOfClass:[NSNumber class]]) {
                [self setValue:[NSNumber numberWithBool:NO] forKey:key];
            }
        }
    }
    return self;
}

@end
