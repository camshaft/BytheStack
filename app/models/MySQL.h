//
//  MySQL.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/5/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MySQL : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * enableOutsideAccess;
@property (nonatomic, retain) NSString * pathToLog;

@end
