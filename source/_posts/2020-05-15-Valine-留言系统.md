---
title: ' Valine 留言系统'
date: 2020-05-15 12:36:57
tags: 
  - blog
categories:
  - blog
updated: 
---

## 缘起

继续折腾 Hexo，这次尝试启用文章的留言系统。NexT 主题预置了 Disqus、畅言、Valine、LiveRe、Gitalk 这几家，比较下来感觉 Valine 最契合 NexT 的主题风格，就是它了。

<!-- more -->

## 过程

### 创建 LeanCloud 应用

Valine 基于 LeanCloud 提供的数据服务，参考 Valine 的 [官方教程](https://valine.js.org/quickstart.html)，首先前往 [leancloud.cn](https://leancloud.cn/) 注册账号。

我选择了华北区，提交注册信息后 LeanCloud 提示国区账号必需实名制，否则无法创建应用。我按照要求提交了手持身份证的照片和身份证国徽一面的照片。大约1小时后，实名制审核通过。

注意，我所用的 Valine v1.3.9 有 Bug，如果 LeanCloud 选择华东区会报 410 错误：

```
Code : undefined [410 GET https://avoscloud.com/1.1/classes/Comment]
```



接着我创建了一个应用，命名为 `Valine`，方案选择开发版，即可以在一定的用量限制下免费运行。

进入创建好的应用，就能获取到 `App ID` 和 `App Key`。

顺便，进入 `设置` > `安全中心` > `Web 安全域名`，填写站点的域名并保存：

```
https://domain.com
https://www.domain.com
```

### 配置 NexT

编辑 `next/_config.yml`，找到对应的模块，修改配置如下：

```
valine:
  enable: true
  appid: <App ID>
  appkey: <App Key>
  notify: false
  verify: false
  placeholder: <留言编辑框里的默认文本>
  avatar: mm
  guest_info: nick,mail,link
  pageSize: 10
  language: zh-cn
  visitor: false
  comment_count: true
```

再次部署 Hexo 后就能看到留言系统已经启用。

### 配置邮件提醒

Valine 借用 LeanCloud 的密码重置接口提供了简易的邮件提醒支持。

> 注意：这个支持实在太过简易，仅仅是聊胜于无的意义。它并不会在我的文章被评论时发出提醒，而是当某位留下邮箱的评论者被他人回复时才会发出提醒，并且在通知也中无法给到具体文章的地址。

进入 LeanCloud 应用的`设置` > `邮件模板`，编辑 `用于重置密码的邮件主题` 如下：

```
你在 {{appname}} 的评论收到了新的回复
```

以及 `内容` 如下：

```
<p>Hi {{username}}, </p>
<p>
你在 {{appname}} 的评论收到了新的回复，请点击查看：
</p>
<p><a href="你的网址首页链接" style="display: inline-block; padding: 10px 20px; border-radius: 4px; background-color: #3090e4; color: #fff; text-decoration: none;">马上查看</a></p>
```

然后在 Hexo 中修改 `next/_config.yml`，启用通知和验证码：

```
valine:
  notify: true
  verify: true
```

### 编辑文章属性

默认情况下，文章都是允许留言的。对于 `about` 等 `page` 类的文章，则需另行添加 `comments: false` 属性以关闭评论。