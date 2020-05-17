---
title: 优化hexo站点
date: 2020-05-15 13:37:56
tags:
  - blog
categories:
  - blog
updated:
---

# 优化 Hexo 站点


> 注意：由于博客项目存在yarn.lock文件（可以直接删除但不推荐 ），若使用npm i 安装新包后(yarn add不需要)需要yarn install 重置依赖，否则无法锁定添加的依赖项，travis-cli会报yarn --frozen-lockfile的错误, 终止集成更新

## 过程

> 为区别 Hexo 目录下的文件和 NexT 主题下的文件，下文分别使用 `hexo/<文件路径>` 和 `next/<文件路径>` 以示区别。

<!-- more -->

### 基础配置相关

#### 配置永久链接

默认的文章地址略显繁琐，并且显得过于动态，我希望显示为 `website.com/category/2019-07/a-random-post.html` 的形式。

编辑 `hexo/_config.yml`，配置永久链接为：

```
permalink: :category/:year-:month/:title.html
```

#### 创建二级页面

创建「关于」和「分类」这两个页面文件：

```
$ hexo new page about
$ hexo new page categories
```

编辑 `next/_config.yml`，反注释需要启用的页面：

```
menu:
  home: / || home
  about: /about/ || user
  categories: /categories/ || th
  archives: /archives/ || archive
```

我并不习惯使用「标签」，所以暂不启用。



#### 启用分类

编辑 `hexo/source/categories/index.md`，添加 `type` 和 `comments` 字段并配置如下：

```
---
title: 分类
date: <日期>
type: "categories"
comments: false
---
```

每当撰写文章，需添加分类属性：

```
---
title: <文章标题>
date: <日期>
categories:
- <分类名称>
---
```

编辑文章的默认模板 `hexo/scaffolds/post.md`，添加分类字段：

```
---
title: {{ title }}
date: {{ date }}
categories:
-
tags:
---
```

编辑 `hexo/_config.yml`，修改默认分类的名称。同时对分类名称做中英文映射，以避免文章地址出现中文。

```
default_category: misc
category_map:
  折腾笔记: learning
  街拍摄影: photograph
  文摘评论: writting
  心情杂念: life
```

#### 启用图片

> 对于在文章中插入图片，Hexo 有多种解决方案。如果手边有稳定的 CDN 图床，外链是最优的方案。不过对于本站，我采用的是启用本地资源文件夹的方案。

编辑 `hexo/_config.yml`，启用文章资源文件夹 `post_asset_folder: true`

安装对应的插件：`npm install hexo-asset-image --save`

这样，每当使用 `hexo n <文章名称>` 新建文章时，会自动在 `hexo/source/_post/` 下生成一个同名的文件夹，用于放置该文章所用到的图片等资源。

之后，就可以在文章中通过下列方式插入图片。

```
![<图片 Alt 文本>](./<本文标题>/<图片名称>)
```

### 主题相关

#### 备份配置文件

在对 NexT 的配置文件做任何修改之前，先备份好默认配置：

```
$ cd hexo/themes/next
$ cp _config.yml _config.yml.original
```

编辑 `next/_config.yml`，每项配置都做了很好的注释，根据需要分别修改。

#### 设置 Favicon

按照官方说明，使用 [realfavicongenerator.net](https://realfavicongenerator.net/) 生成各个平台所需的 Favicon 文件。

然后，在 `hexo/source/` 下新建图像文件夹：

```
$ mkdir hexo/source/images
```

下载生成好的 Favicon 文件包，解压后放入该文件夹。

编辑 `next/_config.yml`，修改并核对各种规格 Favicon 的路径：

```
favicon:
  small: /images/favicon-16x16.png
  medium: /images/favicon-32x32.png
  apple_touch_icon: /images/apple-touch-icon.png
  safari_pinned_tab: /images/safari-pinned-tab.svg
  android_manifest: /images/site.webmanifest
  ms_browserconfig: /images/browserconfig.xml
```

#### 配置访问统计

编辑 `next/_config.yml`，反注释所需的统计工具，并填写对应的 ID：

```
baidu_analytics: <id>
google_analytics:
  tracking_id: UA-XXXXXXXX-X
  localhost_ignored: true
cnzz_siteid: <id>
```

#### 修改 Footer 样式

针对底部的一些样式修改：

```
icon:
  name: pencil
powered:
  version: false
theme:
  version: false
```

#### 修改 SEO 设置

针对主流搜索引擎做一些设置：

```
disable_baidu_transformation: true
baidu_site_verification: <百度资源验证码>
```

至于 Google 的收录，只要正在使用 Google Analytics，就可以前往 [Google Search Console](https://search.google.com/search-console) 添加单个站点。

#### 修改文本对齐模式

NexT 默认是两端对齐，我希望改为居左：

```
text_align: left
```

#### ~~启用首页文章的自动摘要~~

> 自动摘要的效果一般，不推荐使用。建议手动在文章中插入 `` 来做摘要。

```
auto_excerpt:
  enable: true
  length: 300
```

### 插件相关

#### 启用图片灯箱效果

Next 提供了 fancybox 插件的方案，下载插件到 `next/sourse/lib/` 目录（新版本不需要下载））：

```
$ cd hexo/themes/next
$ git clone https://github.com/theme-next/theme-next-fancybox3 source/lib/fancybox
```

编辑 `next/_config.yml`，启用插件：

```
fancybox: true
```

#### 启用图片延迟加载

Next 提供了 lazyload 插件的方案，下载插件到 `next/sourse/lib/` 目录（新版本不需要下载）：

```
$ cd hexo/themes/next
$ git clone https://github.com/theme-next/theme-next-jquery-lazyload source/lib/jquery_lazyload
```

编辑 `next/_config.yml`，启用插件：

```
lazyload: true
```

#### 启用加载条

Next 提供了 pace 插件的方案，下载插件到 `next/sourse/lib/` 目录：

```
$ cd hexo/themes/next
$ git clone https://github.com/theme-next/theme-next-pace source/lib/pace
```

编辑 `next/_config.yml`，启用插件：

```
pace: true
```

#### 启用置顶文章功能

安装插件：

```
$ npm install hexo-generator-topindex --save
```

编辑需要置顶的文章，加入 `top: <数字>` 属性，数字越大，优先级越高，例如：

```
---
title: <文章名称>
date: 2019-07-23 19:44:29
categories: 
- <分类名称>
tags:
top: 1
---
```


