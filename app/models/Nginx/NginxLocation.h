//
//  NginxLocation.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/7/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Nginx.h"

@class NginxServer;

@interface NginxLocation : Nginx {
@private
}
@property (nonatomic, retain) NSString * alias;
@property (nonatomic, retain) NSNumber * internal;
@property (nonatomic, retain) id limit_except;
@property (nonatomic, retain) id try_files;
@property (nonatomic, retain) NSString * definition;
@property (nonatomic, retain) NginxServer *server;

@end
