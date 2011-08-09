//
//  PHPXdebug.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PHP;

@interface PHPXdebug : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * xdebug_remote_handler;
@property (nonatomic, retain) NSNumber * xdebug_collect_params;
@property (nonatomic, retain) NSNumber * xdebug_show_exception_trace;
@property (nonatomic, retain) NSString * xdebug_dump_SESSION;
@property (nonatomic, retain) NSNumber * xdebug_dump_undefined;
@property (nonatomic, retain) NSNumber * xdebug_trace_options;
@property (nonatomic, retain) NSNumber * xdebug_trace_format;
@property (nonatomic, retain) NSString * xdebug_output_dir;
@property (nonatomic, retain) NSNumber * xdebug_extended_info;
@property (nonatomic, retain) NSString * xdebug_profiler_output_name;
@property (nonatomic, retain) NSNumber * xdebug_auto_trace;
@property (nonatomic, retain) NSNumber * xdebug_show_local_vars;
@property (nonatomic, retain) NSNumber * xdebug_max_nesting_level;
@property (nonatomic, retain) NSNumber * xdebug_remote_port;
@property (nonatomic, retain) NSNumber * xdebug_collect_return;
@property (nonatomic, retain) NSNumber * xdebug_dump_once;
@property (nonatomic, retain) NSString * xdebug_profiler_output_dir;
@property (nonatomic, retain) NSNumber * xdebug_var_display_max_children;
@property (nonatomic, retain) NSNumber * xdebug_default_enable;
@property (nonatomic, retain) NSNumber * xdebug_profiler_aggregate;
@property (nonatomic, retain) NSNumber * xdebug_profiler_enable;
@property (nonatomic, retain) NSString * xdebug_dump_POST;
@property (nonatomic, retain) NSString * xdebug_dump_ENV;
@property (nonatomic, retain) NSString * xdebug_idekey;
@property (nonatomic, retain) NSNumber * xdebug_profiler_enable_trigger;
@property (nonatomic, retain) NSNumber * xdebug_collect_vars;
@property (nonatomic, retain) NSNumber * xdebug_dump_globals;
@property (nonatomic, retain) NSNumber * xdebug_remote_autostart;
@property (nonatomic, retain) NSString * xdebug_remote_mode;
@property (nonatomic, retain) NSNumber * xdebug_show_mem_delta;
@property (nonatomic, retain) NSString * xdebug_trace_output_dir;
@property (nonatomic, retain) NSNumber * xdebug_auto_profile;
@property (nonatomic, retain) NSNumber * xdebug_remote_enable;
@property (nonatomic, retain) NSNumber * xdebug_auto_profile_mode;
@property (nonatomic, retain) NSString * xdebug_trace_output_name;
@property (nonatomic, retain) NSNumber * xdebug_profiler_append;
@property (nonatomic, retain) NSString * xdebug_remote_log;
@property (nonatomic, retain) NSString * xdebug_remote_host;
@property (nonatomic, retain) NSNumber * xdebug_var_display_max_depth;
@property (nonatomic, retain) NSNumber * xdebug_collect_includes;
@property (nonatomic, retain) NSString * xdebug_dump_GET;
@property (nonatomic, retain) NSNumber * xdebug_var_display_max_data;
@property (nonatomic, retain) NSString * xdebug_manual_url;
@property (nonatomic, retain) NSString * xdebug_dump_REQUEST;
@property (nonatomic, retain) NSString * xdebug_dump_FILES;
@property (nonatomic, retain) NSString * xdebug_dump_COOKIE;
@property (nonatomic, retain) NSString * xdebug_dump_SERVER;
@property (nonatomic, retain) PHP *php;

@end
