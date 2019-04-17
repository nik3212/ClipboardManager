//
//  ContentProvider.m
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

#import "WindowManagerBridge.h"

#include "WindowManagerHelper.hpp"

@interface ContentProvider()
@property WindowManagerHelper* helper;
@end

@implementation ContentProvider

- (instancetype) init {
    if (self = [super init]) {
        self.helper = new WindowManagerHelper();
    }
    return self;
}

- (instancetype) initWithPid:(int)pid {
    if (self = [super init]) {
        self.helper = new WindowManagerHelper(pid);
    }
    return self;
}

- (NSString*)getPath {
    return [NSString stringWithUTF8String:_helper->get_application_path().c_str()];
}

- (NSString*)getPlistPath:(NSString*)path {
    return [NSString stringWithUTF8String:_helper->get_plist_path(std::string([path UTF8String])).c_str()];
}

- (pid_t)getPid {
    return _helper->get_pid();
}

- (void)setPid:(pid_t)pid {
    _helper->set_pid(pid);
}

@end
