//
//  NginxInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "BaseInstaller.h"

@implementation BaseInstaller

- (id)initWithArgs:(NSArray*)args
{
    self = [super init];
    if (self) {
        brewArgs = [args retain];
    }
    
    return self;
}

- (void)install {
    if (!brewInstall) {
        [NSException raise:@"Unable to install formula" format:@"either brewInstall or brewRemote must be set"];
    }
    
    NSMutableArray *_brewArgs = [NSMutableArray arrayWithObjects:@"install",@"-v",brewInstall, nil];
    
    [_brewArgs addObjectsFromArray:brewArgs];
    
    TaskWrapper *brewTask = [[TaskWrapper alloc] 
                             initWithCommandPath:[[PathFinder applicationResourceDirectoryPath] stringByAppendingFormat:@"%@/brew",BREW_PATH]
                             workingDir:@"/"
                             arguments:_brewArgs
                             environment:[NSDictionary dictionary]
                             delegate:self];
    
    [brewTask startTask];
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didProduceOutput:(NSString *)output {
    
    [[GTMLogger sharedLogger] logDebug:@"%@", output];
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didFinishTaskWithStatus:(int)terminationStatus {
    
}

- (NSString*)brewPath {
    return [[PathFinder applicationResourceDirectoryPath] stringByAppendingString:@"resources/brew"];
}



@end
