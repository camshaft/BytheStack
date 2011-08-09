//
//  NginxHTTP.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Nginx.h"

@class NginxServer;

@interface NginxHTTP : Nginx {
@private
}
@property (nonatomic, retain) NSNumber * client_header_buffer_size;
@property (nonatomic, retain) NSNumber * client_header_timeout;
@property (nonatomic, retain) NSNumber * large_client_header_buffers;
@property (nonatomic, retain) NSNumber * optimize_server_names;
@property (nonatomic, retain) NSNumber * port;
@property (nonatomic, retain) NSNumber * server_names_hash_bucket_size;
@property (nonatomic, retain) NSNumber * server_names_hash_max_size;
@property (nonatomic, retain) NSNumber * timer_resolution;
@property (nonatomic, retain) NSNumber * underscores_in_headers;
@property (nonatomic, retain) NSNumber * variables_hash_bucket_size;
@property (nonatomic, retain) NSNumber * variables_hash_max_size;
@property (nonatomic, retain) NSNumber * worker_processes;
@property (nonatomic, retain) NSNumber * worker_rlimit_nofile;
@property (nonatomic, retain) NSSet *servers;
@end

@interface NginxHTTP (CoreDataGeneratedAccessors)

- (void)addServersObject:(NginxServer *)value;
- (void)removeServersObject:(NginxServer *)value;
- (void)addServers:(NSSet *)values;
- (void)removeServers:(NSSet *)values;

@end
