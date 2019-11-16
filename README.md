<p align="center">
<img src="https://user-images.githubusercontent.com/17319991/57161104-5c07b400-6df3-11e9-8384-8699ba82cbd6.png" alt="ClipboardManager" title="ClipboardManager" width="838"/>
</p>

<p align="center">
<a href="https://travis-ci.org/nik3212/ClipboardManager"><img src="https://img.shields.io/travis/nik3212/ClipboardManager/master.svg"></a>
<a href="https://github.com/nik3212/ClipboardManager/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg"></a>
<a href="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://img.shields.io/github/repo-size/nik3212/ClipboardManager"><img src="https://img.shields.io/github/repo-size/nik3212/ClipboardManager"></a>
<a href="https://img.shields.io/badge/Language-Swift-orange.svg"><img src="https://img.shields.io/badge/Language-Swift-orange.svg"></a>
  
ClipboardManager is a wrapper for the system clipboard for macOS.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Features

- [x] Receive notification that data was changed.
- [x] Receive application icon and name.
- [x] Save own data to the system clipboard.

## Requirements:

* macOS 10.12+
* XCode 10.0
* Swift 5.0+

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate ClipboardManager into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "nik3212/ClipboardManager" ~> 1.0.0
```

```bash
$ carthage update
```

### Manually

#### Embedded Framework

* Open up Terminal, cd into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```
* Add ClipboardManager as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:
  ```bash
  $ git submodule add https://github.com/nik3212/ClipboardManager.git
  ```
* Open the new `ClipboardManager` folder, and drag the `ClipboardManager.xcodeproj` into the Project Navigator of your application's Xcode project. 
  > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.
  
* Select the `ClipboardManager.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
* Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
* In the tab bar at the top of that window, open the "General" panel.
* Click on the `+` button under the "Embedded Binaries" section.
* You will see two different `ClipboardManager.xcodeproj` folders each with two different versions of the `ClipboardManager.framework` nested inside a `Products` folder.
    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `ClipboardManager.framework`.
* Select the `ClipboardManager.framework` for macOS.
* And that's it!
  > The `ClipboardManager.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

## Usage

Import ClipboardManager into your project.

``` swift
import ClipboardManager
```

Create an instance of ClipboardManager.

``` swift
let clipboardManager = ClipboardManager()
```

### Receive data

Set the clipboardManager instance's delegate property to self.

``` swift
clipboardManager.delegate = self
```

Conform to the ClipboardManagerDelegate protocol by implementing `func clipboardDidChange(item: ClipboardItem)` to receive notifications that the item on the clipboard was changed.

``` swift
func clipboardDidChange(item: ClipboardItem) {
  print(item)
}
```

Retrieving data from `ClipboardItem`:

``` swift
// Application icon
item.windowInfo.icon

// Application name
print(item.windowInfo.applicationName)

// Date
print(item.content.date)

// String data representation
if let item = item.content.pasteboardItem,
  item.types.contains(.string) {
    let data = item.data(forType: .string)
    let str = String(data: data!, encoding: .utf8)!
}
```

### Saving data

ClipboardManager contains two methods for saving data to clipboard:

``` swift
/// Copy the item to the system clipboard.
///
/// - Parameters:
///   - object: A property list containing data to initialize the receiver.
///   - type: A UTI supported by the receiver for reading (one of the types returned by readableTypes(for:)).
public func copy(object: Any, type: NSPasteboard.PasteboardType)
    
/// Copy the item to the system clipboard.
///
/// - Parameter item: Item to be copy to the system clipboard.
public func copy(_ item: ClipboardItem)
```

### Clear context

ClipboardManager supports clear data stored into clipboard.

``` swift
clipboardManager.clear()
```

## Contributing

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author

Nikita Vasilev, nv3212@gmail.com

## License

ClipboardManager is available under the MIT license. See the LICENSE file for more info.
