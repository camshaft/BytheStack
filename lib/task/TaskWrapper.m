// Based on Apple's "Moriarity" sample code at// <http://developer.apple.com/library/mac/#samplecode/Moriarity/Introduction/Intro.html>// See the accompanying LICENSE.txt for Apple's original terms of use.#import "TaskWrapper.h"@implementation TaskWrapper// Do basic initialization- (id)initWithCommandPath:(NSString *)pathToCommand               workingDir:(NSString *)aWorkingDir				arguments:(NSArray *)commandArguments				 delegate:(id <TaskWrapperDelegate>)aDelegate;{	self = [super init];	if (self)	{		taskDelegate = aDelegate;		commandPath = [pathToCommand copy];        workingDir = [aWorkingDir copy];		arguments = [commandArguments retain];	}		return self;}// tear things down- (void)dealloc{	[self stopTask];		[task release];	[commandPath release];    [workingDir release];	[arguments release];		[super dealloc];}// Here's where we actually kick off the process via an NSTask.- (void)startTask{	// We first let the delegate know that we are starting	if ([(id)taskDelegate respondsToSelector:@selector(taskWrapperWillStartTask:)])	{		[taskDelegate taskWrapperWillStartTask:self];	}		task = [[NSTask alloc] init];	// The output of stdout and stderr is sent to a pipe so that we can catch it later	// and send it along to the delegate; notice that we don't bother to do anything with stdin,	// so this class isn't as useful for a task that you need to send info to, not just receive.	[task setStandardOutput: [NSPipe pipe]];	[task setStandardError: [task standardOutput]];	// The path to the binary is the first argument that was passed in	[task setLaunchPath: commandPath];    [task setCurrentDirectoryPath: workingDir];	// The rest of the task arguments are just grabbed from the array	[task setArguments: arguments];    // Set the environment    char* cpath = getenv("PATH");    NSMutableString *path = [NSMutableString stringWithCString:cpath encoding:NSStringEncodingConversionExternalRepresentation];        [task setEnvironment:[NSDictionary dictionaryWithObjectsAndKeys:path,@"PATH",NSHomeDirectory(),@"HOME", nil]];		// Here we register as an observer of the NSFileHandleReadCompletionNotification, which lets	// us know when there is data waiting for us to grab it in the task's file handle (the pipe	// to which we connected stdout and stderr above).  -_taskDidProduceOutput: will be called when there	// is data waiting.  The reason we need to do this is because if the file handle gets	// filled up, the task will block waiting to send data and we'll never get anywhere.	// So we have to keep reading data from the file handle as we go.	[[NSNotificationCenter defaultCenter] addObserver:self 											 selector:@selector(_taskDidProduceOutput:) 												 name: NSFileHandleReadCompletionNotification 											   object: [[task standardOutput] fileHandleForReading]];	// We tell the file handle to go ahead and read in the background asynchronously, and notify	// us via the callback registered above when we signed up as an observer.  The file handle will	// send a NSFileHandleReadCompletionNotification when it has data that is available.	[[[task standardOutput] fileHandleForReading] readInBackgroundAndNotify];		// launch the task asynchronously	[task launch];    }// If the task ends, there is no more data coming through the file handle even when the notification is// sent, or the process object is released, then this method is called.- (void)stopTask{	/*    // we tell the delegate that we finished, via the callback, and then blow away our connection	 // to the delegate.  NSTasks are one-shot (not for reuse), so we might as well be too.	 if ([(id)delegate respondsToSelector:@selector(taskWrapper:didFinishTaskWithStatus:)])	 {     [delegate taskWrapper:self didFinishTaskWithStatus:[task terminationStatus]];	 }	 delegate = nil;*/	NSData *data;		// It is important to clean up after ourselves so that we don't leave potentially deallocated	// objects as observers in the notification center; this can lead to crashes.	[[NSNotificationCenter defaultCenter] removeObserver:self name:NSFileHandleReadCompletionNotification object: [[task standardOutput] fileHandleForReading]];		// Make sure the task has actually stopped!	[task terminate];		while ((data = [[[task standardOutput] fileHandleForReading] availableData]) && [data length])	{		if ([(id)taskDelegate respondsToSelector:@selector(taskWrapper:didProduceOutput:)])		{			[taskDelegate taskWrapper:self didProduceOutput: [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]];		}	}		// we tell the delegate that we finished, via the callback, and then blow away our connection	// to the delegate.  NSTasks are one-shot (not for reuse), so we might as well be too.	if ([(id)taskDelegate respondsToSelector:@selector(taskWrapper:didFinishTaskWithStatus:)])	{		[taskDelegate taskWrapper:self didFinishTaskWithStatus:[task terminationStatus]];	};	taskDelegate = nil;}// This method is called asynchronously when data is available from the task's file handle.// We just pass the data along to the delegate as an NSString.- (void)_taskDidProduceOutput:(NSNotification *)aNotification{	NSData *data = [[aNotification userInfo] objectForKey:NSFileHandleNotificationDataItem];	// If the length of the data is zero, then the task is basically over - there is nothing	// more to get from the handle so we may as well shut down.	if ([data length])	{		// Send the data on to the delegate; we can't just use +stringWithUTF8String: here		// because -[data bytes] is not necessarily a properly terminated string.		// -initWithData:encoding: on the other hand checks -[data length]		if ([(id)taskDelegate respondsToSelector:@selector(taskWrapper:didProduceOutput:)])		{			[taskDelegate taskWrapper:self didProduceOutput:[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]];		}	} else {		// We're finished here		[self stopTask];	}		// we need to schedule the file handle go read more data in the background again.	[[aNotification object] readInBackgroundAndNotify];  }@end