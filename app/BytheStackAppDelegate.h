//
//  BytheStackAppDelegate.h
//  BytheStack
//
//  Created by Cameron Bytheway on 8/4/11.
//  Copyright 2011 Big Thumb Electronics. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "MemcachedInstaller.h"
#import "MongoDBInstaller.h"
#import "NginxInstaller.h"
#import "NodeInstaller.h"
#import "PHPInstaller.h"
#import "BrewInstaller.h"

@interface BytheStackAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSPersistentStoreCoordinator *__persistentStoreCoordinator;
    NSManagedObjectModel *__managedObjectModel;
    NSManagedObjectContext *__managedObjectContext;
}

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

- (IBAction)installAll:(id)sender;
- (IBAction)installMemcached:(id)sender;
- (IBAction)installMongoDB:(id)sender;
- (IBAction)installMySQL:(id)sender;
- (IBAction)installNginx:(id)sender;
- (IBAction)installNode:(id)sender;
- (IBAction)installPHP:(id)sender;

@end
