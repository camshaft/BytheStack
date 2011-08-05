//
//  Apache.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/5/11.
//  Copyright (c) 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Apache : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * authn_file_module;
@property (nonatomic, retain) NSNumber * authn_dbm_modle;
@property (nonatomic, retain) NSNumber * authn_anon_module;
@property (nonatomic, retain) NSString * pathToLog;

@end
