# MLBPasswordTextField
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/meilbn/MLBPasswordTextField/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/MLBPasswordTextField.svg)](https://github.com/meilbn/MLBPasswordTextField)
[![Language](https://img.shields.io/badge/language-Objective--C-brightgreen.svg)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://www.apple.com/nl/ios/)
[![Support](https://img.shields.io/badge/support-iOS%207+%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

A custom password input like WeChat payment for iOS.

**[中文介绍](https://github.com/meilbn/MLBPasswordTextField#中文介绍)**

![][Demo_v0.0.3]

## Demo Project
See ``MLBPasswordTextFieldDemo/MLBPasswordTextFieldDemo.xcworkspace``.

## Usage
### In Programmatically

```ObjectiveC
MLBPasswordTextField * textField = [[MLBPasswordTextField alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
```

### In Iterface Builder
Drag an UITextField to your Storyboard or XIB, set its class to MLBPasswordTextField.

That's it!

If you want to custom, using properties in the Attributes Inspector.

![][Demo_In_IB]

### Delegate

Delegate Implement delegate below to get called when input complete:

```ObjectiveC
- (void)mlb_passwordTextField:(MLBPasswordTextField *)pwdTextField didFilledPassword:(NSString *)password;
```

## Features
- [x] Easy to use
- [x] Use with Storyboards, XIBs, Code
- [x] Design in Storyboard or XIB
- [x] Cursor supported (>= 0.0.3)

## Version History
- 0.0.4 Fixed render view rect border has 1 pixel space when border width is 0.5 in iPhone 5S(i.e. 2x).
- 0.0.3 Support show cursor.
- 0.0.2 Bug fixes. Draw border and dot more precision.
- 0.0.1 First version. Contains common features.

## Installation
### CocoaPods
1. Add ``pod 'MLBPasswordTextField'`` to your Podfile.
2. Run ``pod install`` or ``pod update``.
3. Import \<MLBPasswordTextField/MLBPasswordTextField.h\>.

### Carthage
Not yet supported.

### Manually
1. Download all the files in the ``MLBPasswordTextField`` subdirectory.
2. Add the source files to your Xcode project.
3. Import ``MLBPasswordTextField.h``.

## Requirements
This library requires ``iOS 7.0+`` 和 ``Xcode 8.0+``.

## Tested Devices
### Devices
iPhone 5S (iOS 8.3)

iPhone 7 Plus (iOS 10.1.1)

### Simulators
iPhone 6 (iOS 9.3)

iPhone 7 (iOS 10.1)

## License
MLBPasswordTextField is provided under the MIT license. See LICENSE file for details.

# 中文介绍
一个 iOS 上自定义的密码输入文本框，类似于微信支付。

## 演示项目
运行 ``MLBPasswordTextFieldDemo/MLBPasswordTextFieldDemo.xcworkspace``。

## 使用方式
### 代码中使用

```ObjectiveC
MLBPasswordTextField * textField = [[MLBPasswordTextField alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
```

### Iterface Builder 中使用
拖拽一个 ``UITextField`` 到你的 Storyboard 或者 XIB 中，将其 Class 设置为 ``MLBPasswordTextField``。

就这样！

如果想自定义，可以使用 Attributes Inspector 中提供的属性。

![][Demo_In_IB]

### Delegate
当输入完成时，可以使用 Delegate 的委托方法来获取回调：

```ObjectiveC
- (void)mlb_passwordTextField:(MLBPasswordTextField *)pwdTextField didFilledPassword:(NSString *)password;
```

## 功能
- [x] 使用简单
- [x] 可以在 Storyboards、XIB 中使用，当然也可以通过代码创建
- [x] 可以在 Storyboard 或者 XIB 中配置自定义属性
- [x] 支持显示光标 (版本 >= 0.0.3)

## 版本历史
- 0.0.4 修复了当 borderWidth 为 0.5（也就是默认宽度）时，在 iPhone 5S（也就是 2x） 上画的边框存在 1 像素空隙的 bug。
- 0.0.3 支持显示光标。
- 0.0.2 Bug 修复。更加精确地画边框和点。
- 0.0.1 第一版。

## 安装
### CocoaPods
1. 在 Podfile 中添加 ``pod 'MLBPasswordTextField'``。
2. 运行 ``pod install`` 或 ``pod update``。
3. 导入 \<MLBPasswordTextField/MLBPasswordTextField.h\>。

### Carthage
暂未支持。

### 手动安装
1. 下载 MLBPasswordTextField 文件夹内所有源文件。
2. 将 MLBPasswordTextField 文件夹内所有源文件添加（拖入）到你的工程中。
3. 导入 ``MLBPasswordTextField.h``。

## 系统要求
该项目最低支持 ``iOS 7.0+`` 和 ``Xcode 8.0+``。

## 测试设备
### 真机
iPhone 5S (iOS 8.3)

iPhone 7 Plus (iOS 10.1.1)

### 模拟器
iPhone 6 (iOS 9.3)

iPhone 7 (iOS 10.1)

## 许可证
MLBPasswordTextField 使用 MIT 许可证，详情见 LICENSE 文件。

[Demo]: https://github.com/meilbn/MLBPasswordTextField/blob/master/Screenshots/Demo.gif
[Demo_v0.0.3]: https://github.com/meilbn/MLBPasswordTextField/blob/master/Screenshots/Demo_v0.0.3.gif

[Demo_In_IB]: https://github.com/meilbn/MLBPasswordTextField/blob/master/Screenshots/Demo_In_IB.png