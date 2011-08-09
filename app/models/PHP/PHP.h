//
//  PHP.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MustacheModel.h"

@class PHPFPM;

@interface PHP : MustacheModel {
@private
}
@property (nonatomic, retain) NSNumber * allow_call_time_pass_reference;
@property (nonatomic, retain) NSNumber * allow_url_fopen;
@property (nonatomic, retain) NSNumber * allow_url_include;
@property (nonatomic, retain) NSNumber * allow_webdav_methods;
@property (nonatomic, retain) NSNumber * always_populate_raw_post_data;
@property (nonatomic, retain) NSString * arg_separator_input;
@property (nonatomic, retain) NSString * arg_separator_output;
@property (nonatomic, retain) NSNumber * asp_tags;
@property (nonatomic, retain) NSNumber * assert_active;
@property (nonatomic, retain) NSNumber * assert_bail;
@property (nonatomic, retain) NSString * assert_callback;
@property (nonatomic, retain) NSNumber * assert_quiet_eval;
@property (nonatomic, retain) NSNumber * assert_warning;
@property (nonatomic, retain) NSString * auto_append_file;
@property (nonatomic, retain) NSNumber * auto_detect_line_endings;
@property (nonatomic, retain) NSNumber * auto_globals_jit;
@property (nonatomic, retain) NSString * auto_prepend_file;
@property (nonatomic, retain) NSNumber * date_default_latitude;
@property (nonatomic, retain) NSNumber * date_default_longitude;
@property (nonatomic, retain) NSNumber * date_sunrise_zenith;
@property (nonatomic, retain) NSNumber * date_sunset_zenith;
@property (nonatomic, retain) NSString * date_timezone;
@property (nonatomic, retain) NSString * default_charset;
@property (nonatomic, retain) NSString * default_mimetype;
@property (nonatomic, retain) NSNumber * default_socket_timeout;
@property (nonatomic, retain) NSNumber * detect_unicode;
@property (nonatomic, retain) NSString * disable_classes;
@property (nonatomic, retain) NSString * disable_functions;
@property (nonatomic, retain) NSNumber * display_errors;
@property (nonatomic, retain) NSNumber * display_startup_errors;
@property (nonatomic, retain) NSString * doc_root;
@property (nonatomic, retain) NSString * docref_ext;
@property (nonatomic, retain) NSString * docref_root;
@property (nonatomic, retain) NSNumber * enable_dl;
@property (nonatomic, retain) NSString * error_append_string;
@property (nonatomic, retain) NSString * error_log;
@property (nonatomic, retain) NSString * error_prepend_string;
@property (nonatomic, retain) NSNumber * error_reporting;
@property (nonatomic, retain) NSNumber * expose_php;
@property (nonatomic, retain) NSString * extension_dir;
@property (nonatomic, retain) id extensions;
@property (nonatomic, retain) NSNumber * file_uploads;
@property (nonatomic, retain) NSString * from;
@property (nonatomic, retain) NSString * gpc_order;
@property (nonatomic, retain) NSNumber * html_errors;
@property (nonatomic, retain) NSNumber * ignore_repeated_errors;
@property (nonatomic, retain) NSNumber * ignore_repeated_source;
@property (nonatomic, retain) id include_path;
@property (nonatomic, retain) NSNumber * log_errors;
@property (nonatomic, retain) NSNumber * log_errors_max_len;
@property (nonatomic, retain) NSNumber * magic_quotes_gpc;
@property (nonatomic, retain) NSNumber * magic_quotes_runtime;
@property (nonatomic, retain) NSNumber * max_execution_time;
@property (nonatomic, retain) NSNumber * max_file_uploads;
@property (nonatomic, retain) NSNumber * max_input_nesting_level;
@property (nonatomic, retain) NSNumber * max_input_time;
@property (nonatomic, retain) NSString * memory_limit;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * open_basedir;
@property (nonatomic, retain) NSString * post_max_size;
@property (nonatomic, retain) NSNumber * precision;
@property (nonatomic, retain) NSString * realpath_cache_size;
@property (nonatomic, retain) NSNumber * realpath_cache_ttl;
@property (nonatomic, retain) NSNumber * register_argc_argv;
@property (nonatomic, retain) NSNumber * register_globals;
@property (nonatomic, retain) NSNumber * register_long_arrays;
@property (nonatomic, retain) NSNumber * report_memleaks;
@property (nonatomic, retain) NSString * request_order;
@property (nonatomic, retain) NSNumber * serialize_precision;
@property (nonatomic, retain) NSNumber * short_open_tag;
@property (nonatomic, retain) NSNumber * sql_safe_mode;
@property (nonatomic, retain) NSNumber * track_errors;
@property (nonatomic, retain) NSString * upload_max_filesize;
@property (nonatomic, retain) NSString * upload_tmp_dir;
@property (nonatomic, retain) NSString * user_agent;
@property (nonatomic, retain) NSString * user_dir;
@property (nonatomic, retain) NSString * variables_order;
@property (nonatomic, retain) NSNumber * xmlrpc_error_number;
@property (nonatomic, retain) NSNumber * xmlrpc_errors;
@property (nonatomic, retain) NSNumber * y2k_compliance;
@property (nonatomic, retain) NSNumber * ze1_compatibility_mode;
@property (nonatomic, retain) NSString * zend_enable_gc;
@property (nonatomic, retain) id zend_extension_debug;
@property (nonatomic, retain) id zend_extension_debug_ts;
@property (nonatomic, retain) id zend_extension_ts;
@property (nonatomic, retain) id zend_extensions;
@property (nonatomic, retain) NSNumber * zend_multibyte;
@property (nonatomic, retain) PHPFPM *fpm;
@property (nonatomic, retain) NSManagedObject *xdebug;

@end
