---
title: Markdowm
date: 2020-05-14 23:28:05
tags: 
  - git
  - blog
categories: 
  - 项目管理
update: 
top: 1
---

# Markdown(轻量级标记语言)

必要的设计和说明文档能使开发过程中更加有效率，Markdown作为一种轻量级标记语言致力于使阅读和创作文档变得容易。

- [官网](https://www.markdownguide.org/): <https://www.markdownguide.org/>
- [中文文档](https://markdown-zh.readthedocs.io): <https://markdown-zh.readthedocs.io>

## 工具

### 编辑器(独立软件类)

<https://blog.csdn.net/davidhzq/article/details/100815332>

- [Typora](https://typora.io/)(个人推荐)官网: <https://typora.io/>   

  > 设计风格简洁和写作体验自我感觉特别舒适
  >
  > 使用详解： <https://sspai.com/post/54912>
  >
  > 支持Mac os， windows， linux

- [MacDown](https://macdown.uranusjr.com/)(for macOS)官网: <https://macdown.uranusjr.com/>

- [MarkdownPad](http://www.markdownpad.com/)(for Windows)官网: <http://www.markdownpad.com/>

- [Ulysses III](https://ulysses.app/)官网：<https://ulysses.app/>

- 优秀的md编辑器还有很多，选择一款适合自己的就可以。除了这些独立软件的还有VS Code、WebStorm Sublime text这些主流编辑器以插件的方式编译


### 应用(博客、电子书、帮助文档)

- [GitHub Pages](https://pages.github.com/)官网: https://pages.github.com/    搭建教程: https://sspai.com/post/54608

  >`Github Pages `是GitHub开源免费提供给用户用来展示个人或者项目主页的静态网页系统,可以通过[Hexo](https://hexo.io/)或者[jekyll](http://jekyllcn.com/)等静态网站生成工具搭建出个人或组织的博客站点，即将Markdown文档(.md)批量转化为静态网页托管在Github Pages上。

- 静态网站生成器

  - [GitBook](https://www.gitbook.com/)官网: <https://www.gitbook.com/> 	中文文档: <http://caibaojian.com/gitbook/>

    >`GitBook`文档站点生成器，是一个基于 Node.js 的命令行工具，可使用 Github/Git 和 Markdown 来制作精美的电子书，团队或个人可以在其上编写产品、API接口文档以及团队内部知识库。
    >`GitBook` 改版之后，感觉的团队更专注于商业产品而不是开源工具，同时CLI工具不再提供了，所以无法实现个性化部署，所以不做介绍，有兴趣的可以看其官网。

  - [Docsify](https://docsify.js.org)(个人推荐)官网: <https://docsify.js.org>     GitHub): <https://github.com/docsifyjs/docsify>

    > `Docsify` 是一个动态生成文档网站的工具。不同于 GitBook、Hexo 的地方是它不会生成将 .md 转成 .html 文件，所有转换工作都是在运行时进行。
    > Docsify是基于 Vue，完全的运行时驱动，不需要渲染html，所以对 SEO 不够友好。如果不关注 SEO，安装简单化不想有大量依赖，他是比较好的选择，比如公司或这团队内部的文档系统。

  - [Hexo](https://hexo.io/)(个人推荐)官网: https://hexo.io/     中文文档: <https://hexo.io/zh-cn/docs/>

    > `Hexo` 是一个快速、简洁且高效的博客框架。Hexo 使用 Markdown（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。
    > Hexo 配合他的主题模块，比如Next主题，可以作为非常简洁方便的静态博客系统。

  - [Nuxt](https://zh.nuxtjs.org/)官网: <https://zh.nuxtjs.org/>

    >`Nuxt.js` 是一个基于 Vue.js 的通用应用框架。通过对客户端/服务端基础架构的抽象组织，Nuxt.js 主要关注的是应用的 UI渲染。Nuxt.js 的目标是创建一个灵活的应用框架，你可以基于它初始化新项目的基础结构代码，或者在已有 Node.js 项目中使用 Nuxt.js。
    >Nuxt 更像是为构建应用程序而生的，而不是独立的内容静态网站。

  - 其他的生成器还有[jekyll官网](http://jekyllcn.com/)、[Docute 官网](https://docute.org/zh/)、 [VuePress官网](https://vuepress.vuejs.org/zh/) 就不一一叙述了，有兴趣的可以查看相关的官方文档

- 其他

  - 使用[GitHub Pages](https://pages.github.com/)+ [Hexo](https://hexo.io/) 搭建个人博客: https://www.jianshu.com/p/ed04e4eead3e以及https://www.cnblogs.com/liuxianan/p/build-blog-website-by-hexo-github.html

  - 使用[Typora](https://typora.io/)+[Docsify](https://docsify.js.org)+[GitHub Pages](https://pages.github.com/)搭建团队知识库: https://www.jianshu.com/p/84b46b67031d

