---
title: 自定义APlayer
date: 2020-05-17 15:17:44
tags: 
  - blog 
  - APlayer
categories: 
  - blog
updated:
---

# 自定义音乐播放器

>本站所用的音乐播放器是由DIYgod所制作的APlayer，其详细资料可参见[这里](https://aplayer.js.org/)。
>
>next < 8.0 版本， 8版本next使用nunjcks进行模版布局，方式上会有所不同，但原理是一样的

<!-- more -->

## 安装APlayer插件

  npm install aplayer --save

  安装完后在node_modules目录下找到APlayer.min.js文件，将其复制到theme/next/source/js/src/目录下。

生成音乐播放器

  在你想要加入音乐播放器的地方插入以下代码，本站把他放在了侧边栏里，具体操作如下。

  打开theme/next/layout/_custom/文件夹下的 `sidebar.swig`文件，向其中添加以下代码：

```js
<!-- 音乐播放器 -->
  <script src="/js/APlayer.min.js"></script>
  <script type="text/javascript">
    var ap = new APlayer({
        element: document.getElementById('player1'),                       // Optional, player element
        narrow: false,                                                     // Optional, narrow style
        autoplay: false,                                                    // Optional, autoplay song(s), not supported by mobile browsers
        showlrc: 0,                                                        // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
        mutex: true,                                                       // Optional, pause other players when this player playing
        theme: '#e6d0b2',                                                  // Optional, theme color, default: #b7daff
        mode: 'random',                                                    // Optional, play mode, can be `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
        preload: 'metadata',                                               // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
        listmaxheight: '513px',                                             // Optional, max height of play list
        music: {                                                           // Required, music info, see: ###With playlist
            title: '你曾是少年',                                          // Required, music title
            author: 'S.H.E',                          // Required, music author
            url: 'https://sharefs.yun.kugou.com/202005171443/744b11ff3e496075d050f09b378f9fc5/G150/M05/0D/03/NocBAFvzlKGACNvnAEEcw12f_DU451.mp3',  // Required, music url
            pic: '/images/visitor.jpg',  // Optional, music picture
        }
    });
  </script>
```



这里的歌曲url必须是在线音乐https外链，当时现在大部分播放器都不会曝露出真实的歌曲播放地址，找资源很是费劲。这里给大家推荐一个[解析平台](http://music.xf1433.com)，大部分的音乐还是可以解析出来或者直接在该平台上找到播放链接的。大家可以写多个music结构，以此来添加多个音乐。
> 酷狗能产生https外链，但只有一天时效，过期了得重新生成一下
  当然，我们还可以通过添加网易云音乐外链的方式在我们的博客中添加音乐。打开theme/next/layout/_custom/文件夹下的sidebar.swig文件，向其中添加以下代码：

<div id="music163player">
    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=458789090&auto=0&height=66"></iframe>
</div>

```
<div id="music163player">
    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=458789090&auto=0&height=66"></iframe>
</div>
```


  替换上述代码中的iframe标签之间的内容，就可以替换不同的音乐进行播放了。网易云音乐的歌单也可以生成外链，前提是歌单里的歌曲都有版权哦~

自定义播放器样式

  包含颜色更改，列表歌曲信息的排版修改。

  在theme/next/source/css/_custom文件夹下打开custom.styl文件，往里面添加以下代码：

```stylus
.aplayer-list ol li:hover {   /*列表悬停颜色*/
                  background:rgba(255, 255, 255, 1) none repeat scroll !important;}
.aplayer-list ol li {   /*列表底色*/
                        background:rgba(255, 255, 255, 1);}
.aplayer-list-light {   /*列表播放歌曲颜色*/
                      background:rgba(255, 255, 255, 1) none repeat scroll !important;}
#player1 {    /*边框样式*/
          border-radius: 6px;
          div,ol {border-radius: 6px;}
        }
#player1 *{color: rgba(255, 255, 255, 1);}    /*字体颜色*/
/*列表歌曲信息的排版*/
.aplayer-list-index{float:left;}
.aplayer-list-title{float:left;}
.aplayer-list-author{float:right;}
```



## 音乐播放控制边栏

  这一步要在自定义音乐播放器的配置完成之后才能进行，因为aplayer-controler依赖于aplayer来实现播放功能。

### 安装aplayer-controler插件

​	npm install aplayer-controler --save

### 添加js代码

 安装Aplayer-Controler的js文件：Aplayer-Controler.js

 将其放入theme/next/source/js/src下。

### 创建按钮区域

 在theme/next/layout/_custom/文件夹下新建一个myapcontroler.swig的文件。向其中添加以下代码：

```js
<script src="/js/src/Aplayer-Controler.js"></script>
<div id="AP-controler"></div>
<script type="text/javascript">
var myapc=new APlayer_Controler({
        APC_dom:$('#AP-controler'),
        aplayer:ap, //此为绑定的aplayer对象
        attach_right:true,
        position:{top:'300px',bottom:''},
        fixed:true,
        btn_width:100,
        btn_height:120,
        img_src:['http://oty1v077k.bkt.clouddn.com/bukagirl.jpg',
                'http://oty1v077k.bkt.clouddn.com/jumpgirl.jpg',
                'http://oty1v077k.bkt.clouddn.com/pentigirl.jpg',
                'http://oty1v077k.bkt.clouddn.com/%E8%90%8C1.gif'],
        img_style:{repeat:'no-repeat',position:'center',size:'contain'},
        ctrls_color:'rgba(173,255,47,0.8)',
        ctrls_hover_color:'rgba(255,140,0,0.7)',
        tips_on:true,
        tips_width:140,
        tips_height:25,
        tips_color:'rgba(255,255,255,0.6)',
        tips_content:{},
        timeout:30
    });
</script>
```




### 将控制按钮加入body页面

​	在theme/next/layout文件夹下打开`_layout.swig`
文件，在前添加以下代码：

```
{% include '_custom/myapcontroler.swig' %}
```

 到此，自定义音乐播放控制边栏就基本完成，完成整个配置需要根据自己的主题背景进一步修改完善。

