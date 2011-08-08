//
//  NginxServer.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Nginx.h"

@class NginxHTTP, NginxLocation;

@interface NginxServer : Nginx {
@private
}
@property (nonatomic, retain) NSString * access_log;
@property (nonatomic, retain) NSNumber * client_header_buffer_size;
@property (nonatomic, retain) NSNumber * client_header_timeout;
@property (nonatomic, retain) NSString * error_log;
@property (nonatomic, retain) NSNumber * isDefaultServer;
@property (nonatomic, retain) NSNumber * large_client_header_buffers;
@property (nonatomic, retain) NSNumber * optimize_server_names;
@property (nonatomic, retain) NSNumber * port;
@property (nonatomic, retain) NSString * server_name;
@property (nonatomic, retain) id try_files;
@property (nonatomic, retain) NSNumber * underscores_in_headers;
@property (nonatomic, retain) NSNumber * isPHPServer;
@property (nonatomic, retain) NSSet *locations;
@property (nonatomic, retain) NginxHTTP *http;
@end

@interface NginxServer (CoreDataGeneratedAccessors)

- (void)addLocationsObject:(NginxLocation *)value;
- (void)removeLocationsObject:(NginxLocation *)value;
- (void)addLocations:(NSSet *)values;
- (void)removeLocations:(NSSet *)values;

@end
