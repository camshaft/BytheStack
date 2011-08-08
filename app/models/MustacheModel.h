//
//  MustacheModel.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/6/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "GRMustache.h"

@interface MustacheModel : NSManagedObject

- (void)saveConfigToFile:(NSString*)path;

+ (NSString*)mustacheFileName;

@end
