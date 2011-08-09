//
//  BrewInstaller.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TaskWrapper.h"

@interface BrewInstaller : NSObject <TaskWrapperDelegate> {
}

- (void)install;

@end
