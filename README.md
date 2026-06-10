# LessElegantNote

## 项目特色 Features
这是一个Typst笔记模板，是在[南京大学学位论文 Typst 模板 modern-nju-thesis ](https://github.com/nju-lug/modern-nju-thesis)的基础上修改而成的。感谢原作者的工作。

本项目有以下特色：
+ 中文友好（支持中文加粗），字体的选择符合常规需求（如正文宋体，标题黑体）。
+ 页面风格极简而不失优雅，参考了[ElegantBook: 优美的 LaTeX 书籍模板](https://github.com/ElegantLaTeX/ElegantBook)的风格。
+ 数学定理环境支持。导入第三方包，更好地呈现数学定理、证明、引理等。

**项目效果预览**：

<img src="https://github.com/choglost/LessElegantNote/blob/main/example/images/cover-example.png" height="400px">  <img src="https://github.com/choglost/LessElegantNote/blob/main/example/images/outline-example.png" height="400px">

<img src="https://github.com/choglost/LessElegantNote/blob/main/example/images/chinese-example.png" height="400px">  <img src="https://github.com/choglost/LessElegantNote/blob/main/example/images/maths-example.png" height="400px">

## 项目结构

```text
LessElegantNote/
  lib.typ                 # 模板统一入口
  layouts/                # 文档、正文、附录布局
  pages/                  # 封面、目录、字体展示页
  utils/config.typ        # 全局默认配置
  utils/heading.typ       # 标题风格和编号规则
  utils/font-style.typ    # 字体和字号配置
  utils/                  # 其他常用格式工具
  third-lib-config/       # 第三方包配置
  example/                # 示例文档和图片素材
```

新建笔记时，建议把 `LessElegantNote/` 作为模板文件夹放进自己的笔记仓库，在外层创建自己的 `.typ` 文件并导入 `LessElegantNote/lib.typ`。
默认参数集中在 `utils/config.typ`，标题编号和标题视觉参数集中在 `utils/heading.typ`，因此日常自定义通常不需要修改 `layouts/` 和 `pages/`。

`example/minimal.typ` 是最小入口示例，`example/appendix.typ` 用于检查附录标题、图表编号和公式编号，`example/less-elegant-note.typ` 是完整展示文档。

## 使用指南 Manual
1. 下载VS Code并安装 （可以选择System Installer，为Windows系统的所有用户安装）
https://code.visualstudio.com/Download#

2. 打开VS Code，安装插件。在左边栏选择方块图案（即插件商店），搜索Chinese下载中文语言包，搜索Typst下载Tinymist Typst插件。

3. 打开Github，点击绿色按钮下载ZIP，并解压。 https://github.com/choglost/LessElegantNote

4. 用VS Code打开已解压的模板文件夹，参考 [example/less-elegant-note.typ](https://github.com/choglost/LessElegantNote/blob/main/example/less-elegant-note.typ)，创建你自己的笔记。

## 学习文档和社区 Community
* [Typst官方文档](https://typst.app/docs)
* [Typst中文教程（小蓝书）](https://typst-doc-cn.github.io/tutorial/introduction.html)

## 更新目标
1. 完善参考文档。
2. 其他功能支持，如前言、参考文献。
3. 上传我自己的笔记成果。
