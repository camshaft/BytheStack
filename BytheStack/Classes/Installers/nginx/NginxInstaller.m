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

- (void)requestFinished:(ASIHTTPRequest *)request {
    
    NSTask *tarTask = [[NSTask alloc] init];
    
    NSMutableArray *tarArgs = [NSMutableArray arrayWithObjects:
                               @"-xvzf",
                               [filename stringByAppendingPathExtension:extension],
                               nil];
    
    [tarTask setArguments:tarArgs];
    [tarTask setCurrentDirectoryPath:tempPath];
    [tarTask setLaunchPath:@"/usr/bin/tar"];
    [tarTask launch];
    
    [tarTask waitUntilExit];
    
    NSString *installDir = [[self applicationResourceDirectory] stringByAppendingPathComponent:@"/lib/nginx/"];
    
    // make task object
    NSTask *aTask = [[NSTask alloc] init];
    
    // set arguments
    
    NSMutableArray *args = [NSMutableArray arrayWithObjects:
                            @"-c",
                            [NSString stringWithFormat:@"%@/configure",[tempPath stringByAppendingPathComponent:filename]],
                            [NSString stringWithFormat:@"--sbin-path=%@/bin/nginx",installDir],
                            @"--with-http_ssl_module",
                            @"--without-mail_pop3_module",
                            @"--without-mail_imap_module",
                            @"--without-mail_smtp_module",
                            @"--with-http_stub_status_module",
                            @"--with-cc-opt=-Wno-deprecated-declaration",
                            [NSString stringWithFormat:@"--prefix=%@",installDir],
                            nil];
    
    [aTask setArguments:args];
    
    [aTask setTerminationHandler:^(NSTask *task) {
        
        [aTask terminate];
        
        [NSThread detachNewThreadSelector:@selector(makeInstall) toTarget:self withObject:nil];
    }];
    
    // launch
    [aTask setCurrentDirectoryPath:[tempPath stringByAppendingPathComponent:filename]];
    [aTask setLaunchPath:@"/bin/sh"];
    [aTask launch];
}

- (void)makeInstall {
    
    NSTask *makeTask = [[NSTask alloc] init];
    
    // launch
    [makeTask setCurrentDirectoryPath:[tempPath stringByAppendingPathComponent:filename]];
    [makeTask setLaunchPath:@"/usr/bin/make"];
    
    NSMutableArray *args = [[NSMutableArray alloc] initWithObjects:@"install", nil];
    [makeTask setArguments:args];
    
    [makeTask launch];
}

@end
