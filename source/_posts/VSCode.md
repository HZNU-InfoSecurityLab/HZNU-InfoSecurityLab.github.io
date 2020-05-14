---
title: VSCode
comments: true
date: 2020-05-14 23:31:37
tags:
  - guide
categories: 
  - tools
updated:

---

# VS Code编辑器(前端推荐)

前端开发神器，开源、快速、轻量， 相对于厚重的[Webstrom](https://www.jetbrains.com/webstorm/)(大型项目推荐)，不太吃内存，集成功能没有那么丰富， 但也基本能够满足日常的开发，写JS感觉特别爽。相对于最轻量的[Sublime Text](https://www.sublimetext.com/)， 插件多，安装容易，插件生态好了不知多少，和git集成度高

## 教程

- [官网](https://code.visualstudio.com)：<https://code.visualstudio.com>

- 其他指南：<https://sspai.com/post/60116>

  <https://sspai.com/post/60117>

  <https://www.jianshu.com/p/11554732b323>

- Source Control：VS上可视化git操作，挺方便的，但不建议。敲命令行他不香吗？(习惯了没办法hh)

  <https://blog.csdn.net/qq_35393869/article/details/89477264>

  <https://blog.csdn.net/weixin_44326389/article/details/103736775>

## 常用快捷键

- Mac Os下 ：<https://www.cnblogs.com/informatics/p/8315339.html>
- Windows 下：<https://www.cnblogs.com/informatics/p/8315339.html>

## 常用插件

推荐几款好用的VS Code插件，在EXTENSIONS中安装即可

- [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)

  > 一款多项目管理插件，轻松自定义项目列表，支持工作区另存为项目
  >
  > 安装完后, Command + Shift + P(mac)打开命令面板，输入 Project Manager: Edit Projects 打开project.json文件配置项目,  
  >
  > ```json
  > [
  >  {
  >      "name": "Pascal MI",
  >      "rootPath": "c:\\PascalProjects\\pascal-menu-insight",
  >      "paths": [],
  >      "group": "",
  >      "enabled": true
  >  },
  >  {
  >      "name": "Bookmarks",
  >      "rootPath": "$home\\Documents\\GitHub\\vscode-bookmarks",
  >      "paths": [],
  >      "group": "",
  >      "enabled": true
  >  },
  >  {
  >      "name": "Numbered Bookmarks",
  >      "rootPath": "$home\\Documents\\GitHub\\vscode-numbered-bookmarks",
  >      "paths": [],
  >      "group": "",
  >      "enabled": false
  >  }
  > ]
  > ```

  - rootPath为项目所在实际目录

  - enabled 定义项目是否展示在管理器中显示

  - 其他示例：<https://www.cnblogs.com/wangpinzhou/articles/8997289.html>

    <https://blog.csdn.net/ktutu/article/details/78749846>

- [Favoriates](https://marketplace.visualstudio.com/items?itemName=kdcro101.favorites)

  > 将文件和目录添加到**工作区**收藏夹。你可以使用文件和文件夹创建收藏项的组（和子组）。复杂项目的时间节省者。

- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)官网：<https://eslint.org/>    插件化的js代码检测工具

  > ESLint是一个用来识别 ECMAScript 并且按照规则给出报告的代码检测工具，使用它可以避免低级错误和统一代码的风格。如果每次在代码提交之前都进行一次eslint代码检查，就不会因为某个字段未定义为undefined或null这样的错误而导致服务崩溃，可以有效的控制项目代码的质量。

- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)    （Github多人协作推荐，可搭配上[Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)）

  > GitLens **supercharges**内置到Visual Studio代码Git的能力。它可以帮助您通过Git责任注释和代码镜头一目了然地查看**代码作者的身份**，**无缝地导航和浏览** Git存储库，通过强大的比较命令**获得有价值的见解**，等等。 

- 其他(按需引入)：<https://blog.csdn.net/jiandan1127/article/details/85957003>

  https://blog.csdn.net/maixiaochai/article/details/90767129

  https://blog.csdn.net/u014307349/article/details/75256046