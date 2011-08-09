//
//  PHPFPMPool.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PHPFPMPool : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * poolname;
@property (nonatomic, retain) NSString * prefix;
@property (nonatomic, retain) NSString * group;
@property (nonatomic, retain) NSString * listen;
@property (nonatomic, retain) NSString * listen_allowed_clients;
@property (nonatomic, retain) NSNumber * listen_backlog;
@property (nonatomic, retain) NSString * listen_group;
@property (nonatomic, retain) NSString * listen_mode;
@property (nonatomic, retain) NSString * listen_owner;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSString * pm;
@property (nonatomic, retain) NSNumber * pm_max_children;
@property (nonatomic, retain) NSNumber * pm_max_requests;
@property (nonatomic, retain) NSNumber * pm_max_spare_servers;
@property (nonatomic, retain) NSNumber * pm_min_spare_servers;
@property (nonatomic, retain) NSNumber * pm_start_servers;
@property (nonatomic, retain) NSString * pm_status_path;
@property (nonatomic, retain) NSNumber * catch_workers_output;
@property (nonatomic, retain) NSString * chdir;
@property (nonatomic, retain) NSString * chroot;
@property (nonatomic, retain) NSString * ping_path;
@property (nonatomic, retain) NSString * ping_response;
@property (nonatomic, retain) NSString * request_slowlog_timeout;
@property (nonatomic, retain) NSString * request_terminate_timeout;
@property (nonatomic, retain) NSNumber * rlimit_core;
@property (nonatomic, retain) NSNumber * rlimit_files;
@property (nonatomic, retain) NSString * slowlog;
@property (nonatomic, retain) NSManagedObject *fpm;

@end
