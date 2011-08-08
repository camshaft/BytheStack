//
//  MongoDBInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "MemcachedInstaller.h"

@implementation MemcachedInstaller

- (id)initWithArgs:(NSArray*)args
{
    self = [super initWithArgs:args];
    if (self) {
        brewInstall = @"memcached";
    }
    
    return self;
}

@end
