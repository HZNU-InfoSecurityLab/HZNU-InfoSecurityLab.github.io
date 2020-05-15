# IISLab Blog [![Build Status](https://travis-ci.org/HZNU-InfoSecurityLab/HZNU-InfoSecurityLab.github.io.svg?branch=develop)](https://travis-ci.org/github/HZNU-InfoSecurityLab/HZNU-InfoSecurityLab.github.io)
link -> https://hznu-infosecuritylab.github.io

## 博客搭建
 - [GitHub Pages](https://pages.github.com) 托管静态网页
 - [Hexo](https://hexo.io/zh-cn/docs/) 静态博客生成器
  - [Next](http://theme-next.iissnan.com) 博客主题
 - [Travis-cli](https://travis-ci.com) 持续集成服务,可根据大标题右侧build/pass查看

## develop分支上传博客,可阅读Hexo官方文档<https://hexo.io/docs/>
  1. 克隆到本地仓库 git clone -b develop https://github.com/HZNU-InfoSecurityLab/HZNU-InfoSecurityLab.github.io
  2. 每次提交更新前请先拉取合并最新版本， git pull 或者 git fetch + git merge
  3. 新建文章，hexo new "title" 默认post布局， 草稿 hexo new draft "title", 位于`/source/{layout}`目录下
  4. 根据Front-matter 格式开头配置文章(标签，分类等)
  5. git add file ｜｜ git add . 提交所有修改
  6. git status 查看提交状态
  7. git commit -m 'update post year:month:day:title'
  8. git push (--set-upstream指定默认远程主机分支)

## travis-cli集成
```
向仓库blog.git提交commit；
travis-ci 监测dvelop分支，若有改动自动构建blog.git,根据.travis.yml的配置执行；
运行hexo g之后，public目录下文件更新；
将public目录下的文件提交commit；
push最新的静态文件到master。
```