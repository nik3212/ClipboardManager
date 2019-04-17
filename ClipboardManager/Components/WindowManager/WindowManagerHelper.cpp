//
//  WindowManagerHelper.cpp
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

#include "WindowManagerHelper.hpp"

WindowManagerHelper::WindowManagerHelper(): pid(0), ret(0) { }

WindowManagerHelper::WindowManagerHelper(int pid) : pid(pid), ret(0) { }

std::string WindowManagerHelper::get_application_path() {
    ret = proc_pidpath(pid, buf, sizeof(buf));
    std::string path = remove_last_path_component(buf, 2);
    return (ret <= 0) ? "" : path;
}

void WindowManagerHelper::set_pid(pid_t pid) {
    this->pid = pid;
}

int WindowManagerHelper::get_pid() {
    return pid;
}

std::string WindowManagerHelper::get_plist_path(std::string path) {
    if (path.empty()) { return ""; }
    return path + "/Info.plist";
}

std::string WindowManagerHelper::remove_last_path_component(std::string path) {
    return path.substr(0, path.find_last_of("/"));
}

std::string WindowManagerHelper::remove_last_path_component(std::string path, unsigned count) {
    for (int i = 0; i < count; ++i) {
        path = remove_last_path_component(path);
    }
    return path;
}
