//
//  Server.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/5/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Apache, MongoDB, MySQL, Nginx, PHP, Vhost;

@interface Server : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSString * group;
@property (nonatomic, retain) NSNumber * startOnStartup;
@property (nonatomic, retain) PHP *ServerToPHP;
@property (nonatomic, retain) Nginx *ServerToNginx;
@property (nonatomic, retain) Apache *ServerToApache;
@property (nonatomic, retain) MongoDB *ServerToMongoDB;
@property (nonatomic, retain) MySQL *ServerToMySQL;
@property (nonatomic, retain) Vhost *ServerToVhost;

@end
