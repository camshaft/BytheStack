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

- (NSString *)applicationFilesDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *libraryURL = [[fileManager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
    return [[libraryURL path] stringByAppendingPathComponent:@"BytheStack"];
}

- (NSString *)applicationResourceDirectory {
    return [[NSBundle mainBundle] resourcePath];
}

- (void)install {
    NSString *installString = (brewInstall)?brewInstall:brewRemote;
    
    if (!installString) {
        [NSException raise:@"Unable to install formula" format:@"either brewInstall or brewRemote must be set"];
    }
    
    NSMutableArray *_brewArgs = [NSMutableArray arrayWithObjects:@"install",@"-v",installString, nil];
    
    [_brewArgs addObjectsFromArray:brewArgs];
    
    TaskWrapper *brewTask = [[TaskWrapper alloc] 
                                 initWithCommandPath:[[self applicationResourceDirectory] stringByAppendingFormat:@"%@/brew",BREW_PATH]
                                 workingDir:@"/"
                                 arguments:_brewArgs
                                 delegate:self];
    
    [brewTask startTask];
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didProduceOutput:(NSString *)output {
    NSLog(@"%@",output);
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didFinishTaskWithStatus:(int)terminationStatus {
    
}



@end
