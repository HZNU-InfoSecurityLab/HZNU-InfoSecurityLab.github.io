---
title: SVG Sprite
date: 2020-06-09 18:21:35
tags:
  - svg
  - react
categories: 
  - react
updated:
---

# SVG Sprite

## 缘起

以前 vue 项目中使用 svg-sprite-loader 来处理 svg 文件使用非常方便，加载 svg 文件，配置完定义全局组件就好了，最近在写 react 项目，如法炮制，把 vue 中使用 svg 的思路带到 react 中来，实现的效果同样是只要把 svg 文件放到指定文件夹下使用文件名称结合 react 组件就可以使用。
使用步骤如下：

<!-- more -->

1. 安装 svg-sprite-loader

```sh
yarn  add svg-sprite-loader --dev
```

or

```sh
npm i svg-sprite-loader -D
```

2. 配置 /config/webpack.config.js （yarn eject 后的配置 ）

注意：新添加的loader一定要放到file-loader之前

原因：webpack的loader执行是从后往前执行的

```javascript
 // webpack.config.js配置
            {
              test: /\.svg$/,
              use: [
                { 
                  loader: 'svg-sprite-loader'
                },
                {
                  loader: 'svgo-loader',
                  options: {
                    plugins: [
                      {removeTitle: true},
                      {convertColors: {shorthex: true}},
                      {convertPathData: true},
                      {removeComments: true},
                      {removeDesc: true},
                      {removeUselessDefs: true},
                      {removeEmptyAttrs: true},
                      {removeHiddenElems: true},
                      {removeEmptyText: true},
                      {removeUselessStrokeAndFill: true},
                      {moveElemsAttrsToGroup: true},
                      {removeStyleElement: true},
                      {cleanupEnableBackground: true},
                    ],
                  },
                },
              ]
            },
```

3. src 文件夹下新建一个 icons 文件夹

​	`icons` 文件夹下放 svg 文件

​	`icons/index.js` 加载所有 svg 文件夹下 svg 文件

```javascript
const requireAll = requireContext => requireContext.keys().map(requireContext);
const svgs = require.context("./svg", false, /\.svg$/);
requireAll(svgs);
```

然后一定要在react入口文件`index.jsx`中导入`src/icons/index.js`

```javascript
import "./icons";
```

4. Icon 组件

   ```javascript
   const Icon = (props) => (
     <svg width={props.width} height={props.height} fill={props.color} >
     // props.name为svg文件名
       <use xlinkHref={`#${props.name}`} />
     </svg>
   )
   ```

   