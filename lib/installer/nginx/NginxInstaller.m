//
//  NginxInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "NginxInstaller.h"

@implementation NginxInstaller

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        filePrefix = @"nginx-";
        extension = @"tar.gz";
        baseURL = @"http://nginx.org/download/";
    }
    
    return self;
}

- (void)sourceDownloadComplete {

    tarTask = [[TaskWrapper alloc] initWithCommandPath:@"/usr/bin/tar"
                                                       workingDir:tempPath
                                                        arguments:[NSArray arrayWithObjects:
                                                                   @"-xvzf",
                                                                   [filename stringByAppendingPathExtension:extension], nil]
                                                         delegate:self];
    // kick off the process asynchronously
    [tarTask startTask];
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didProduceOutput:(NSString *)output {
    NSLog(@"%@",output);
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didFinishTaskWithStatus:(int)terminationStatus {
    
    NSString *installDir = [[self applicationFilesDirectory] stringByAppendingString:@"/lib/nginx"];
    
    if ([taskWrapper isEqualTo:tarTask]) {
        
        configureTask = [[TaskWrapper alloc] initWithCommandPath:@"/bin/zsh"
                                                      workingDir:[tempPath stringByAppendingPathComponent:filename]
                                                       arguments:[NSArray arrayWithObjects:
                                                                  @"./configure",
                                                                  [NSString stringWithFormat:@"--prefix=%@",installDir],
                                                                  @"--with-http_ssl_module",
                                                                  @"--with-http_stub_status_module",
                                                                  nil]
                                                        delegate:self];
        
        [configureTask startTask];
    } else if ([taskWrapper isEqualTo:configureTask]) {
        
        makeTask = [[TaskWrapper alloc] initWithCommandPath:@"/usr/bin/make"
                                                 workingDir:[tempPath stringByAppendingPathComponent:filename]
                                                  arguments:[NSArray arrayWithObjects:
                                                             @"install",
                                                             nil]
                                                   delegate:self];
        
        [makeTask startTask];
    } else if ([taskWrapper isEqualTo:makeTask]) {
        
    }
}

@end
