//
//  Server.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/5/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import "Server.h"
#import "Apache.h"
#import "MongoDB.h"
#import "MySQL.h"
#import "Nginx.h"
#import "PHP.h"
#import "Vhost.h"


@implementation Server
@dynamic name;
@dynamic user;
@dynamic group;
@dynamic startOnStartup;
@dynamic ServerToPHP;
@dynamic ServerToNginx;
@dynamic ServerToApache;
@dynamic ServerToMongoDB;
@dynamic ServerToMySQL;
@dynamic ServerToVhost;

@end
