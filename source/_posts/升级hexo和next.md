---
title: 升级hexo和next
date: 2020-05-17 15:10:02
tags: 
  - blog
categories: 
  - blog
updated:
---
# 升级 Hexo 和 NexT 主题

## 缘起

​之前用的是next的5版本， 没想到next团队换了仓库， 6以后的版本要到新仓库重新克隆升级，为了以后的升级可维护只好郁闷的重新配置

<!-- more -->

## 过程

### 备份文件

曾手贱错删过重要的文件，后悔莫及懂得了事先备份之必要。

理论上只用备份两个配置文件，即 `hexo/_config.yml` 和 `hexo/themes/next/_config.yml` 。不过，平时佛系的我难得朋克一回，必须搞得硬核一点，干脆来个**自动化整站备份**。 



#### 简易的备份脚本

创建存放备份文件的目录：

```
$ sudo mkdir -p <路径>/bak
```

创建 shell 脚本，加上执行权限：

```
$ sudo touch backup-hexo.sh
$ sudo chmod +x backup-hexo.sh
```

脚本如下：

```
#!/bin/sh
app="hexo"
dir_source="<路径>/hexo"
dir_target="<路径>/bak"

# 将源目录下的所有文件打包，存至目标目录
tar -czvf $dir_target/$app-latest.tar.gz $dir_source/

# 按“星期几”来冗余备份，会覆盖上周同一天的备份包
cp $dir_target/$app-latest.tar.gz $dir_target/$app-day-`date "+%u"`.tar.gz

# 列出目标目录下的文件
ls -alh $dir_target/
```

执行脚本做一次备份，检查执行是否符合预期：

```
$ sudo ./backup-hexo.sh
```



#### 自动定时备份

使用 Linux 系统的 `cron` 来做定时器：

```
$ sudo crontab -e
```

我希望每天早上 6 点执行备份脚本：

```
# m h  dom mon dow   command
  0 6  *   *   *     <路径>/backup-hexo.sh
```

#### 小结

以上工作，会让 Linux 系统每天早上 6 点打包 Hexo 目录下的所有文件，存放到指定的目录中，并保存最近 7 天的备份包。

### 升级 Hexo

> 查阅 Hexo 官网和 GitHub 页面，官方对标准的升级姿势似乎语焉不详。Google 搜索出来的攻略文章也都各执一词。我只好综合各种信息，摸石头过河。

首先进入 Hexo 的目录：

```
$ cd <路径>/hexo
```

随后的各种操作，包括 NexT 的升级，均不需要 `sudo` 。

#### 升级 Hexo 的版本和依赖包

查看 Hexo 的当前版本：

```
$ hexo version
```

目前是 `3.9.0` ，然后看下最新的发行版本 ([Releases](https://github.com/hexojs/hexo/releases))，是 `4.2.0` 。

打开 Hexo 根目录下的 `package.json` 文件，只用修改这一行的版本号：

```
...
"dependencies": {
-   "hexo": "^3.9.0",
+   "hexo": "^4.2.0",
...
```

修改完毕后进行升级：

```
$ npm upgrade
```

提示有依赖需要修复，则无脑修复：

```
$ npm audit fix
```

完成之后验证版本，确认升级成功：

```
$ hexo version
```

#### 后续工作

查阅 `3.9.0` 到 `4.2.0` 之间的更新日志 ([Releases](https://github.com/hexojs/hexo/releases))，确认配置文件上没什么需要增减的。

这次主要受用的变化，是 Hexo 逐渐丢弃了一些依赖，使得静态文件的生成效率大幅提升，参考 [作者的这篇文章](https://blog.skk.moe/post/how-we-make-hexo-4-2-faster/)。

接着，我执行了部署：

```
$ hexo clean
$ hexo g
$ hexo d
```

目测确实快了些。

注意部署之前要做 `clean` 以避免不必要的冲突，特别是这次有版本升级。其实，我早就把这三句命令统一写成了脚本（[参考](https://laytonsun.com/learning/2019-07/a-new-start.html#发布文章和部署更新)）。

部署到服务器后，我用 PC 和手机分别打开站点检查前端，明显的 Bug 还是出现了：

[![img](https://laytonsun.com/learning/2020-04/upgrade-hexo-and-next/01.png)](https://laytonsun.com/learning/2020-04/upgrade-hexo-and-next/01.png)

页面底部的翻页符号变成了代码，还因此收到了热心访客的留言提醒。不用说，这一定是新版本 Hexo 和老版本 NexT 之间的兼容问题。

那么，升级 NexT 势在必行。

### 升级 NexT

> 相比 Hexo 的语焉不详，NexT 的 GitHub 页面说得很清楚。NexT 每个月会发布一个版本，通过 `git pull` 就能更新（[参考](https://github.com/theme-next/hexo-theme-next#update)）。
>
> 当我这么做时，却可耻地失败了。原来我当初是通过 `cURL` 而非 `git clone` 的方式做的安装。无奈，这次没法享受 `git merge` 的便利了。至于原先的配置文件、插件包和任何做过的代码改动，我只能手动复制和比对。
>
> 为了今后更新的便利，我决定通过 `git clone` 重新安装 NexT 。

#### 重新安装 NexT

查看 `themes/next/package.json` 获知当前版本是 `7.2.0` 。

重命名当前版本的文件夹：

```
$ mv themes/next/ themes/next-7.2.0
```

安装最新版本，当前是 `7.8.0` ：

```
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
```

今后再要更新，就只需：

```
$ cd themes/next
$ git pull
```

接着就是对照先前的配置文件，对 `themes/next/_config.yml` 做一遍配置。期间发现若干出入，记在一边待查。

再次部署 Hexo 至服务器后，上文提到的 Bug 果然没了，但是出现了一系列新的问题。

#### 新版本的改动

##### 常用插件的变化

Fancybox 和 Lazyload 不再需要安装依赖，只需在 `themes/next/_config.yml` 开启就行：

```
fancybox: true
lazyload: true
```

Pace 仍然需要安装依赖：

```
$ cd themes/next
$ git clone https://github.com/theme-next/theme-next-pace source/lib/pace
```

在配置文件中开启：

```
pace:
  enable: true
```

新增支持 PJAX ，提升 AJAX 局部加载的速度。首先安装依赖：

```
$ cd themes/next
$ git clone https://github.com/theme-next/theme-next-pjax source/lib/pjax
```

在配置文件中开启：

```
pjax: true
```

##### Font Awesome 的变化

配置文件中 FA 图标的写法变了，例如 `heart` 变成 `fa fa-heart` ，不一而足。

此外，好多图标现在需要付费，导致无法显示。只能去 [图库](https://fontawesome.com/icons) 中寻找相近的免费图标来代替。

##### 侧边栏的变化

现在不管应用 NexT 的哪种布局方案，侧边栏的位置都需要定义：

```
sidebar:
   position: right
```

原本的 `dimmer` 属性不再需要配置，变成默认。但是使用下来，好像只有点击文章两侧的空白区域，才能关闭侧边栏，没之前顺手了。

##### 取消了 iOS Safari 上的彩虹效果

```
- safari_rainbow: true
```

本来是挺有意思的特效，取消了还挺伤心的。退而求其次，我开启了阅读进度条：

```
reading_progress:
   enable: true
```

##### 支持深色模式

在配置文件中开启：

```
darkmode: true
```

我的 iPhone 日落后会自动启用深色模式，届时用 Safari 浏览站点就能看到深色主题。可惜代码块的配色好像没有跟上，有些刺眼。

[![img](https://laytonsun.com/learning/2020-04/upgrade-hexo-and-next/02.jpg)](https://laytonsun.com/learning/2020-04/upgrade-hexo-and-next/02.jpg)

考虑到白色主题下的黑色代码块并不会显得刺眼，我决定对代码块统一使用深色配色。修改 `themes/next/_config.yml` ：

```
codeblock:
  highlight_theme: night eighties
```

顺手把代码块的行号去掉，以更适合手机屏幕显示。修改 `_config.yml` ：

```
highlight:
  line_number: false
```

##### 支持语言切换

在配置文件中开启：

```
language_switcher: true
```

说是底部会出现语言切换按钮，试了下好像并没有，问题待查。

#### 新版本的问题

##### 首页图片路径冲突

部署后打开博客首页，发现文章中的图片都未加载，原因是生成图片的路径错误。原本使用的插件 `hexo-asset-image` 已经停止维护，没有跟上 NexT 的更新，还好有替用插件（[参考](https://github.com/cocowool/hexo-image-link)）。

卸载原插件：

```
$ npm uninstall hexo-asset-image
```

安装新插件：

```
$ npm install hexo-image-link --save
```

##### 图片与备注文字的间隔过小

发现图片下的备注文字和图片挤到一起了。

修改 `themes/next/source/css/_common/components/post/post.styl` ：

```
.post-body {
  ...
  .image-caption, .figure .caption {
    ...
-   margin: -20px auto 15px;
+   margin: -10px auto 15px;
    ...
  }
}
```

##### 全局文本字号变大

部署后发现各处的字体都比之前大了，不协调。

查阅更新日志（[Release](https://github.com/theme-next/hexo-theme-next/releases)）得知 NexT 已经全面改用 `em` 取代 `px` 来控制字号。而默认大小 `1em = 16px` 与之前保持一致，照理不会带来视觉上的变化。

但不知为何，调试前端可发现基础字号实际上是 `1.125em = 18px` 而非预期的 `1em` 。一时半会找不到缘由，问题待查。暂时采用暴力方案解决。 

修改 `themes/next/_config.yml` ：

```
override: false
custom_file_path:
  variable: source/_data/variables.styl #反注释
```

创建外部配置文件：

```
$ touch source/_data/variables.styl
```

内容如下：

```
$font-size-base = 14px
$code-font-size = 11px
```

此举是强行将基础字号 `16px` 的设置覆盖为 `14px` ，于是 `1.125em = 14px*1.125 = 15.75px` ，基本接近原本的视觉效果。