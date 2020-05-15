# IISLab Blog [![Build Status](https://travis-ci.org/HZNU-InfoSecurityLab/HZNU-InfoSecurityLab.github.io.svg?branch=develop)](https://travis-ci.org/github/HZNU-InfoSecurityLab/HZNU-InfoSecurityLab.github.io)
link -> https://hznu-infosecuritylab.github.io

## 博客搭建
 - [GitHub Pages]() 托管静态网页
 - [Hexo]() 静态博客生成器
  - [Next]() 主题
 - [Travis-cli] 持续集成服务

## 上传博客
 

## travis-cli集成
```
向仓库blog.git提交commit；
travis-ci 自动构建blog.git,根据.travis.yml的配置执行；
运行hexo g之后，public目录下文件更新；
将public目录下的文件提交commit；
push最新的静态文件到master。
```