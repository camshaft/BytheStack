//
//  NginxInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHPInstaller.h"

@implementation PHPInstaller

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        filePrefix = @"php-";
        urlSuffix = @"/from/this/mirror";
        extension = @"tar.gz";
        baseURL = @"http://us.php.net/get/";
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
    
    NSString *installDir = [[self applicationResourceDirectory] stringByAppendingPathComponent:@"/lib/php/"];
    
    // make task object
    NSTask *aTask = [[NSTask alloc] init];
    
    // make pipes & hook them up
    //NSPipe *pipe = [NSPipe pipe];
    //NSFileHandle *results = [pipe fileHandleForReading];
    //[aTask setStandardOutput:pipe];
    
    ;
    
    // set arguments
    NSMutableArray *args = [NSMutableArray arrayWithObjects:
                            @"-c",
                            [NSString stringWithFormat: @"\"./configure\" --enable-cli --enable-fpm --with-zlib --enable-mbstring --with-curl --disable-rpath --enable-inline-optimization --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex --with-mhash --enable-zip --with-pear=%@/pear --with-pcre-regex --prefix=%@",installDir,installDir],
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
    
    NSMutableArray *args = [[NSMutableArray alloc] initWithObjects:@"all",@"install", nil];
    [makeTask setArguments:args];
    
    [makeTask launch];
}

@end
