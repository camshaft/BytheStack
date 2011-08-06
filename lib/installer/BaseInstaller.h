//
//  BaseInstaller.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TaskWrapper.h"

@interface BaseInstaller : NSObject <TaskWrapperDelegate> {
    NSString *brewInstall;
    NSString *brewRemote;
    NSArray *brewArgs;
}


- (id)initWithArgs:(NSArray*)args;

- (void)install;
- (NSString *)applicationFilesDirectory;
- (NSString *)applicationResourceDirectory;

@end
