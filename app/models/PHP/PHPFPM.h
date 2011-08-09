//
//  PHPFPM.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/8/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MustacheModel.h"

@class PHP, PHPFPMPool;

@interface PHPFPM : MustacheModel {
@private
}
@property (nonatomic, retain) NSString * error_log;
@property (nonatomic, retain) NSString * emergency_restart_interval;
@property (nonatomic, retain) NSString * process_control_timeout;
@property (nonatomic, retain) NSNumber * daemonize;
@property (nonatomic, retain) NSNumber * emergency_restart_threshold;
@property (nonatomic, retain) NSString * log_level;
@property (nonatomic, retain) NSString * pid;
@property (nonatomic, retain) PHP *php;
@property (nonatomic, retain) NSSet *pools;
@end

@interface PHPFPM (CoreDataGeneratedAccessors)

- (void)addPoolsObject:(PHPFPMPool *)value;
- (void)removePoolsObject:(PHPFPMPool *)value;
- (void)addPools:(NSSet *)values;
- (void)removePools:(NSSet *)values;

@end
