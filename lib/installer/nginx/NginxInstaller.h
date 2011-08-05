//
//  NginxInstaller.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "BaseInstaller.h"

@interface NginxInstaller : BaseInstaller <ASIHTTPRequestDelegate, ASIProgressDelegate> {
    TaskWrapper *tarTask;
    TaskWrapper *configureTask;
    TaskWrapper *makeTask;
}

@end
