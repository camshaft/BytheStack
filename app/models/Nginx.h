//
//  Nginx.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MustacheModel.h"

@interface Nginx : MustacheModel {
@private
}
@property (nonatomic, retain) NSString * aio;
@property (nonatomic, retain) NSNumber * chunked_transfer_encoding;
@property (nonatomic, retain) NSNumber * client_body_buffer_size;
@property (nonatomic, retain) NSNumber * client_body_in_file_only;
@property (nonatomic, retain) NSNumber * client_body_in_single_buffer;
@property (nonatomic, retain) NSString * client_body_temp_path;
@property (nonatomic, retain) NSNumber * client_body_timeout;
@property (nonatomic, retain) NSNumber * client_max_body_size;
@property (nonatomic, retain) NSString * default_type;
@property (nonatomic, retain) NSNumber * directio;
@property (nonatomic, retain) id error_page;
@property (nonatomic, retain) NSString * if_modified_since;
@property (nonatomic, retain) NSString * keepalive_disable;
@property (nonatomic, retain) NSNumber * keepalive_requests;
@property (nonatomic, retain) NSNumber * keepalive_timeout;
@property (nonatomic, retain) NSNumber * limit_rate;
@property (nonatomic, retain) NSNumber * limit_rate_after;
@property (nonatomic, retain) NSString * lingering_close;
@property (nonatomic, retain) NSNumber * lingering_time;
@property (nonatomic, retain) NSNumber * lingering_timeout;
@property (nonatomic, retain) NSNumber * log_not_found;
@property (nonatomic, retain) NSNumber * log_subrequest;
@property (nonatomic, retain) NSNumber * msie_padding;
@property (nonatomic, retain) NSNumber * msie_refresh;
@property (nonatomic, retain) NSString * open_file_cache;
@property (nonatomic, retain) NSString * open_file_cache_errors;
@property (nonatomic, retain) NSNumber * open_file_cache_min_uses;
@property (nonatomic, retain) NSNumber * open_file_cache_valid;
@property (nonatomic, retain) NSString * post_action;
@property (nonatomic, retain) NSNumber * recursive_error_pages;
@property (nonatomic, retain) NSNumber * reset_timedout_connection;
@property (nonatomic, retain) NSString * resolver;
@property (nonatomic, retain) NSNumber * resolver_timeout;
@property (nonatomic, retain) NSString * root;
@property (nonatomic, retain) NSString * satisfy;
@property (nonatomic, retain) NSNumber * send_timeout;
@property (nonatomic, retain) NSNumber * sendfile;
@property (nonatomic, retain) NSNumber * server_name_in_redirect;
@property (nonatomic, retain) NSNumber * server_tokens;
@property (nonatomic, retain) NSNumber * tcp_nodelay;
@property (nonatomic, retain) NSNumber * tcp_nopush;
@property (nonatomic, retain) id types;

@end
