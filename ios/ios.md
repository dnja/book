## IOS发布

- 1、打开 developer.apple.com
- 2、device 选项中添加设备号
- 3、配置证书 －》Provisioning Profiles  －》 Development －》添加 －》 选择iOS App Development －》 选择app ID －》Select All 开发者－》Select All 设备号 －》设置名称 －》下载 －》运行
- 4、链接真机 －》 选中项目工程 －》Build Settings －》Code Signing －》 Provisioning Profile 选择刚才下载导入的的配置文件 －》 将Code Signing Identity5个选项都选择对应证书（PROJECT / TARGETS都设置）
- 5、连接真机运行（不要在模拟器中运行） －》 查看Products下的xxx.app是否黑色文字（红色表示有问题）
- 6、打开iTunes －》选择 。。。 下的应用程序 －》将Products下的xxx.app拖至 应用程序栏中 －》在应用程序界面找到app图标 －》 选中拖至桌面 －》 完成导出。
