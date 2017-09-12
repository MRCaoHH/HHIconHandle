# iOS图标处理
### 0x0 版本信息

|版本|时间|人员|
|---|---|---|
|v1.0.0|2017/09/12|曹辉辉|

### 0x1 源码编译
setp 1
打开终端克隆项目

```
```

setp 2

```
carthage update --platform iOS
```



### 0x2 app icon
支持用一张图片导出`AppIcon.appiconset`文件，其中包含处理好尺寸的图片和对应的`content.json`文件。

可以同时导出iphone和ipad所需的`AppIcon.appiconset`

### 0x3 LaunchImage

|设备|屏幕方向|系统版本|图片大小|规模（Scale）|
|---|---|---|---|---|
|iPhone|Portrait|iOS 8 Later|414x736|3x|
|iPhone|Portrait|iOS 8 Later|375x667|2x|
|iPhone|Landscape|iOS 8 Later|736x414|3x|
|iPhone|Portrait|iOS 7 Later|320x480|2x|
|iPhone|Portrait|iOS 7 Later|320x568|2x|
|iPad|Portrait|iOS 7 Later|768x1024|2x|
|iPad|Portrait|iOS 7 Later|768x1024|1x|
|iPad|Landscape|iOS 7 Later|1024x768|2x|
|iPad|Landscape|iOS 7 Later|1024x768|1x|


支持用一张图片导出`LaunchImage.launchimage`文件，其中包含处理好尺寸的图片和对应的`content.json`文件。

可以同时导出iphone和ipad所需的`LaunchImage.launchimage`

### 0x4 Custom Icon

支持导出`1x`,`2x`,`3x`三种图片，默认传入的图片是最大输出规模图片，例如传入图片是300x300，如果选择`3x`,`2x`,`1x`输出则尺寸分别为:`300x300`,`200x200`,`100x100`;如果选择`2x`,`1x`输出尺寸分别为:`300x300`,`150x150`

支持同时传入多张图片（工具只会显示其中一张图片）。

