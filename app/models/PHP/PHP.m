//
//  PHP.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHP.h"
#import "PHPFPM.h"


@implementation PHP
@dynamic allow_call_time_pass_reference;
@dynamic allow_url_fopen;
@dynamic allow_url_include;
@dynamic allow_webdav_methods;
@dynamic always_populate_raw_post_data;
@dynamic arg_separator_input;
@dynamic arg_separator_output;
@dynamic asp_tags;
@dynamic assert_active;
@dynamic assert_bail;
@dynamic assert_callback;
@dynamic assert_quiet_eval;
@dynamic assert_warning;
@dynamic auto_append_file;
@dynamic auto_detect_line_endings;
@dynamic auto_globals_jit;
@dynamic auto_prepend_file;
@dynamic date_default_latitude;
@dynamic date_default_longitude;
@dynamic date_sunrise_zenith;
@dynamic date_sunset_zenith;
@dynamic date_timezone;
@dynamic default_charset;
@dynamic default_mimetype;
@dynamic default_socket_timeout;
@dynamic detect_unicode;
@dynamic disable_classes;
@dynamic disable_functions;
@dynamic display_errors;
@dynamic display_startup_errors;
@dynamic doc_root;
@dynamic docref_ext;
@dynamic docref_root;
@dynamic enable_dl;
@dynamic error_append_string;
@dynamic error_log;
@dynamic error_prepend_string;
@dynamic error_reporting;
@dynamic expose_php;
@dynamic extension_dir;
@dynamic extensions;
@dynamic file_uploads;
@dynamic from;
@dynamic gpc_order;
@dynamic html_errors;
@dynamic ignore_repeated_errors;
@dynamic ignore_repeated_source;
@dynamic include_path;
@dynamic log_errors;
@dynamic log_errors_max_len;
@dynamic magic_quotes_gpc;
@dynamic magic_quotes_runtime;
@dynamic max_execution_time;
@dynamic max_file_uploads;
@dynamic max_input_nesting_level;
@dynamic max_input_time;
@dynamic memory_limit;
@dynamic name;
@dynamic open_basedir;
@dynamic post_max_size;
@dynamic precision;
@dynamic realpath_cache_size;
@dynamic realpath_cache_ttl;
@dynamic register_argc_argv;
@dynamic register_globals;
@dynamic register_long_arrays;
@dynamic report_memleaks;
@dynamic request_order;
@dynamic serialize_precision;
@dynamic short_open_tag;
@dynamic sql_safe_mode;
@dynamic track_errors;
@dynamic upload_max_filesize;
@dynamic upload_tmp_dir;
@dynamic user_agent;
@dynamic user_dir;
@dynamic variables_order;
@dynamic xmlrpc_error_number;
@dynamic xmlrpc_errors;
@dynamic y2k_compliance;
@dynamic ze1_compatibility_mode;
@dynamic zend_enable_gc;
@dynamic zend_extension_debug;
@dynamic zend_extension_debug_ts;
@dynamic zend_extension_ts;
@dynamic zend_extensions;
@dynamic zend_multibyte;
@dynamic fpm;
@dynamic xdebug;

+ (NSString*)mustacheFileName {
    return @"php.ini";
}

@end
