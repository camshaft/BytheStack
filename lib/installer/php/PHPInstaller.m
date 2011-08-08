//
//  NodeInstaller.m
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import "PHPInstaller.h"

@implementation PHPInstaller

- (id)initWithArgs:(NSArray*)args
{
    self = [super initWithArgs:args];
    if (self) {
        brewInstall = @"https://raw.github.com/adamv/homebrew-alt/master/duplicates/php.rb";
    }
    
    return self;
}

- (void)taskWrapper:(TaskWrapper *)taskWrapper didFinishTaskWithStatus:(int)terminationStatus {
    
    /*
    
    TaskWrapper *xdebugTask = [[TaskWrapper alloc] 
                               initWithCommandPath:@"/bin/zsh"
                               workingDir:@"/"
                               arguments:[NSArray arrayWithObjects:@"/Users/Cameron/Library/Developer/Xcode/DerivedData/BytheStack-bcwvshzfrtmldkcxolyskmrbspds/Build/Products/Debug/BytheStack.app/Contents/Resources/resources/brew/bin/pecl",@"install",@"xdebug", nil]
                               delegate:self];
    
    [xdebugTask startTask];
     */
    
}

@end
