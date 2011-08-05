//
//  NginxInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "BaseInstaller.h"

@implementation BaseInstaller

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        filePrefix = @"";
        fileSuffix = @"";
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

- (NSString *)tempDirectory {
    NSString * tempDir = NSTemporaryDirectory();
    if (tempDir == nil)
        tempDir = @"/tmp";
    
    NSString * template = [tempDir stringByAppendingPathComponent: [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] stringByAppendingString:@"-temp.XXXXXX"]];    
    
    const char * fsTemplate = [template fileSystemRepresentation];
    NSMutableData * bufferData = [NSMutableData dataWithBytes: fsTemplate
                                                       length: strlen(fsTemplate)+1];
    char * buffer = [bufferData mutableBytes];
    char * result = mkdtemp(buffer);
    return [[NSFileManager defaultManager]
            stringWithFileSystemRepresentation: buffer
            length: strlen(buffer)];
}

- (void)installVersion:(NSString*)newVersion {
    version = [newVersion retain];
    filename = [[NSString stringWithFormat:@"%@%@%@",filePrefix,version,fileSuffix] retain];
    
    NSString *tarName = [[NSString stringWithFormat:@"%@.%@",filename,extension] retain];
    
    NSURL *url = [NSURL URLWithString:[baseURL stringByAppendingFormat:@"%@%@",tarName,urlSuffix]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    tempPath = [[self tempDirectory] retain];
    
    [request setDownloadDestinationPath:[tempPath stringByAppendingPathComponent:tarName]];
    
    [request setDelegate:self];
    [request setDownloadProgressDelegate:self];
    
    [request startAsynchronous];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"Request failed.\n%@\nResponse:\n%@\nStatus Code: %d",[request error],[request responseString],[request responseStatusCode]);
}

- (void)request:(ASIHTTPRequest *)request didReceiveBytes:(long long)bytes {
    NSLog(@"%lld",bytes);
}

@end
