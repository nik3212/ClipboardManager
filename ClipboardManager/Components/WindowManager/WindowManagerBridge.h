//
//  WindowManagerBridge.h
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

#ifndef WindowManagerBridge_h
#define WindowManagerBridge_h

#import <Foundation/Foundation.h>

@interface ContentProvider: NSObject
- (instancetype) init;
- (instancetype) initWithPid:(int)pid;
- (NSString*) getPath;
- (NSString*) getPlistPath:(NSString*)path;
- (pid_t)getPid;
- (void)setPid:(pid_t)pid;
@end


#endif /* WindowManagerBridge_h */

