//
//  Vhost.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/5/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Vhost : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * port;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSNumber * ssl;
@property (nonatomic, retain) NSString * sslPathToCertFile;
@property (nonatomic, retain) NSString * sslPathToKeyFile;

@end
