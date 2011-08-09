//
//  BrewInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "BrewInstaller.h"

@implementation BrewInstaller

- (void)install {
    
    TaskWrapper *brewTask = [[TaskWrapper alloc] 
                             initWithCommandPath:@"/usr/bin/ruby"
                             workingDir:@"/"
                             arguments:[NSArray arrayWithObject:[[NSBundle mainBundle] pathForResource:@"install-brew" ofType:@"rb"]]
                             environment:[NSDictionary dictionary]
                             delegate:self];
    
    [brewTask startTask];
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didProduceOutput:(NSString *)output {
    
    [[GTMLogger sharedLogger] logDebug:@"%@", output];
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didFinishTaskWithStatus:(int)terminationStatus {
    
}

@end
