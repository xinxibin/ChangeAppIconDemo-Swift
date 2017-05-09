# ChangeAppIconDemo-Swift


动态更换 App 图标，从 ios 10.3开始，系统已经支持开发者自己实现api来更改应用图标。

## 新的api
系统api更换图标只有三个方法：

```objc

extension UIApplication {

    // If false, alternate icons are not supported for the current process.
    @available(iOS 10.3, *)
    open var supportsAlternateIcons: Bool { get }

    
    // Pass `nil` to use the primary application icon. The completion handler will be invoked asynchronously on an arbitrary background queue; be sure to dispatch back to the main queue before doing any further UI work.
    @available(iOS 10.3, *)
    open func setAlternateIconName(_ alternateIconName: String?, completionHandler: ((Error?) -> Swift.Void)? = nil)

    
    // If `nil`, the primary application icon is being used.
    @available(iOS 10.3, *)
    open var alternateIconName: String? { get }
}

```
## 配置 Info.plist
![](http://oahmyhzk1.bkt.clouddn.com/image/png/CFBundleAlternateIcons.jpeg)

在 CFBundlePrimaryIcon 上面 添加以下代码 

说明：Icon-60、Icon1、Icon2 是图片名，要和CFBundleIconFiles 里面的名字统一
这些图片项目中必须要有

```objc
<key>CFBundleAlternateIcons</key>
        <dict>
            <key>Icon-60</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>Icon-60</string>
                </array>
            </dict>
            <key>Icon2</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>Icon2</string>
                </array>
            </dict>
            <key>Icon1</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>Icon1</string>
                </array>
            </dict>
        </dict>
```

## 配置完成 Info.plist ，下面是代码部分

就是利用上面的Api，判断是否支持更换图片（10.3及以上支持）

```objc

		let app = UIApplication.shared
        if app.supportsAlternateIcons {
            app.setAlternateIconName(icon, completionHandler: { (error) in
                if error != nil {
                    print("error => \(String(describing: error?.localizedDescription))")
                }else {
                    print("Done")
                }
            })
        }

```

## 效果

![](http://oahmyhzk1.bkt.clouddn.com/image/gif/changeAppIcon.gif)

## 可优化

弹框不太爽，要想在后台根据不同场景改变图标，弹框太烦。

解决方法：OC : 可以使用运行时修改方法处理
	Swift 中是暂时不知道怎么处理，怀疑是苹果大爷不想让偷偷的改应用图标
