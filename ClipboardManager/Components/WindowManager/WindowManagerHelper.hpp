//
//  WindowManagerHelper.h
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

#ifndef WindowManagerHelper_h
#define WindowManagerHelper_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <libproc.h>
#include <string>

class WindowManagerHelper {
private:
    pid_t pid;
    int ret;
    char buf[PROC_PIDPATHINFO_MAXSIZE];
public:
    WindowManagerHelper();
    explicit WindowManagerHelper(int);
    
    void set_pid(pid_t);
    int get_pid();
    
    /**
     Path to application.

     @return A string that contains a path to application.
     */
    std::string get_application_path();
    
    /**
     Path to plist of application.

     @return A string that contains a path to plist of application.
     */
    std::string get_plist_path(std::string);
    
protected:
    /* Remove last component from path */
    std::string remove_last_path_component(std::string);
    
    /* Remove several last components from path */
    std::string remove_last_path_component(std::string, unsigned);
};


#endif /* WindowManagerHelper_h */
