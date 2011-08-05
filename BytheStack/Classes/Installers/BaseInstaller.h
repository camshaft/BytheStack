//
//  BaseInstaller.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIHTTPRequest.h"

@interface BaseInstaller : NSObject <ASIHTTPRequestDelegate, ASIProgressDelegate> {
    NSString *tempPath;
    NSString *version;
    NSString *filename;
    NSString *extension;
    NSString *baseURL;
    NSString *filePrefix;
    NSString *fileSuffix;
    NSString *urlSuffix;
}

- (void)installVersion:(NSString*)version;

@end
