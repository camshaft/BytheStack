//
//  PathFinder.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/6/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "PathFinder.h"

@implementation PathFinder

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

/**
 Returns the directory the application uses to store the Core Data store file. This code uses a directory named "BytheStack" in the user's Library directory.
 */
+ (NSURL *)applicationFilesDirectory {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *libraryURL = [[fileManager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
    return [libraryURL URLByAppendingPathComponent:@"BytheStack"];
}

+ (NSString *)applicationFilesDirectoryPath {
    return [[self applicationFilesDirectory] path];
}

+ (NSURL *)applicationResourceDirectory {
    return [[NSBundle mainBundle] resourceURL];
}

+ (NSString *)applicationResourceDirectoryPath {
    return [[self applicationResourceDirectory] path];
}

+ (NSString *)applicationServerPath {
    return @"/srv";
}

@end
