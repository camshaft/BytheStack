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
    
    /*
     TaskWrapper *tarTask = [[TaskWrapper alloc] initWithDelegate:self arguments:
     [NSMutableArray arrayWithObjects:
     @"/usr/bin/tar",
     tempPath,
     @"-xvzf",
     [filename stringByAppendingPathExtension:extension], nil] callback:@selector(tarComplete)];
     */
    
    
    tarTask = [[TaskWrapper alloc] initWithCommandPath:@"/usr/bin/tar"
                                                       workingDir:tempPath
                                                        arguments:[NSArray arrayWithObjects:
                                                                   @"-xvzf",
                                                                   [filename stringByAppendingPathExtension:extension], nil]
                                                         delegate:self];
    // kick off the process asynchronously
    [tarTask startTask];
    
    /*
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
     
     NSString *installDir = [[self applicationFilesDirectory] stringByAppendingString:@"/lib/nginx/"];
     
     
     
     system([[NSString stringWithFormat:@"cd %@",[tempPath stringByAppendingPathComponent:filename]] cStringUsingEncoding:NSStringEncodingConversionExternalRepresentation]);
     system([[NSString stringWithFormat:@"./configure --prefix=%@",installDir] cStringUsingEncoding:NSStringEncodingConversionExternalRepresentation]);
     /*
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
     [self makeInstall];
     
     }];
     
     // launch
     [aTask setCurrentDirectoryPath:[tempPath stringByAppendingPathComponent:filename]];
     [aTask setLaunchPath:@"/bin/sh"];
     [aTask launch];
     */
    //system([@"/usr/bin/make" cStringUsingEncoding:NSStringEncodingConversionExternalRepresentation]);
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didProduceOutput:(NSString *)output {
    NSLog(@"%@",output);
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didFinishTaskWithStatus:(int)terminationStatus {
    
    NSString *installDir = [[self applicationFilesDirectory] stringByAppendingString:@"/lib/nginx/"];
    
    if ([taskWrapper isEqualTo:tarTask]) {
        
        configureTask = [[TaskWrapper alloc] initWithCommandPath:@"/bin/zsh"
                                                      workingDir:[tempPath stringByAppendingPathComponent:filename]
                                                       arguments:[NSArray arrayWithObjects:
                                                                  @"./configure",
                                                                  @"--with-http_ssl_module",
                                                                  @"--with-ipv6",
                                                                  @"--without-mail_pop3_module",
                                                                  @"--without-mail_imap_module",
                                                                  @"--without-mail_smtp_module",
                                                                  @"--without-http_autoindex_module",
                                                                  @"--without-http_ssi_module",
                                                                  @"--without-http_auth_basic_module",
                                                                  @"--without-http_browser_module",
                                                                  @"--without-http_empty_gif_module",
                                                                  @"--without-http_geo_module",
                                                                  @"--without-http_limit_req_module",
                                                                  @"--without-http_limit_zone_module",
                                                                  @"--without-http_map_module",
                                                                  @"--without-http_memcached_module",
                                                                  @"--without-http_proxy_module",
                                                                  @"--without-http_referer_module",
                                                                  @"--without-http_scgi_module",
                                                                  @"--without-http_split_clients_module",
                                                                  @"--without-http_upstream_ip_hash_module",
                                                                  @"--without-http_userid_module",
                                                                  @"--without-http_uwsgi_module",
                                                                  @"--with-cc-opt=-O2",
                                                                  [NSString stringWithFormat:@"--prefix=\"%@\"",installDir],
                                                                  [NSString stringWithFormat:@"--sbin-path=\"%@/sbin/\"",installDir],
                                                                  @"--with-cc-opt=\"-Wno-deprecated-declarations\"",
                                                                  nil]
                                                        delegate:self];
        
        [configureTask startTask];
    } else if ([taskWrapper isEqualTo:configureTask]) {
        [configureTask release];
        [self performSelectorOnMainThread:@selector(performMake) withObject:nil waitUntilDone:NO];
    } else if ([taskWrapper isEqualTo:makeTask]) {
        
    }
}

- (void)performMake {
    
    makeTask = [[TaskWrapper alloc] initWithCommandPath:@"/usr/bin/make"
                                             workingDir:[tempPath stringByAppendingPathComponent:filename]
                                              arguments:[NSArray arrayWithObjects:
                                                         //@"install",
                                                         nil]
                                               delegate:self];
    
    [makeTask startTask];
}

@end
