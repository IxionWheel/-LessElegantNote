// LessElegantNote 模板示例。
// 这个文件展示推荐的文档结构、常用排版能力和附录用法。

#import "../lib.typ": *
#import "../third-lib-config/ctheorems.typ": *

#let (
  // 布局
  doc,
  mainmatter,
  appendix,
  // 页面
  cover,
  outline-page,
  fonts-display-page,
) = documentclass(
  twoside: false,
  info: (
    title: "LessElegantNote\nTypst 笔记模板",
    author: "choglost",
    date: datetime.today(),
    cover-image: "../example/images/cover.jpg",
    style-name: "maths",
  ),
)

#show: doc

#cover()

#outline-page(
  depth: 3,
  outlined: false,
  page-numbering: "I",
)

#fonts-display-page()

#show: mainmatter

#heading(numbering: none)[序言]

LessElegantNote 是一个偏向中文笔记和数学笔记的 Typst 模板。它把封面、目录、正文、附录、字体和常用第三方包配置拆成独立模块，方便按需修改。

= 快速开始

== 最小文档

新建笔记时，通常只需要复制下面的骨架，然后把正文写在 `#show: mainmatter` 后面。

````typ
#import "LessElegantNote/lib.typ": *

#let (
  doc,
  mainmatter,
  appendix,
  cover,
  outline-page,
) = documentclass(
  info: (
    title: "我的数学笔记",
    author: "张三",
    cover-image: none,
  ),
)

#show: doc
#cover()
#outline-page()
#show: mainmatter

= 第一章

正文内容。

#show: appendix.with(title: [附录])

= 补充材料
````

== 推荐目录结构

把模板作为一个独立文件夹放在笔记仓库中，自己的笔记文件放在模板外层，后续升级模板时更清楚。

```text
mynotes/
  my-note.typ
  LessElegantNote/
    lib.typ
    layouts/
    pages/
    utils/
      config.typ
      heading.typ
      font-style.typ
    third-lib-config/
    example/
      minimal.typ
      appendix.typ
      less-elegant-note.typ
```

模板内部主要文件的分工如下：

+ `lib.typ`：统一入口，负责把全局信息传给各个模块。
+ `layouts/`：正文、附录和全局文档设置。
+ `pages/`：封面、目录、字体展示页。
+ `utils/config.typ`：统一默认配置。
+ `utils/heading.typ`：标题风格和编号规则。
+ `utils/font-style.typ`：字体和字号配置。
+ `utils/`：其他常用格式工具。
+ `third-lib-config/`：定理、代码、绘图等第三方包配置。

== 标题编号风格

`style-name` 目前支持三种值：

+ `"maths"`：`1`、`1.1`、`1.1.1`，适合数学笔记和论文式结构。
+ `"literature"`：`第一章`、`第一节`、`一、`，适合阅读笔记。
+ `"book"`：`第一篇`、`第一章`、`第一节`，适合较长的书稿式笔记。

如果没有传入 `style-name`，模板会默认使用 `"maths"`。

= 常用内容示例

== 文本与列表

正文默认首行缩进、两端对齐。可以使用 *strong 类型*、_emph 类型_ 和 `raw 类型`。

+ 一级有序列表。
+ 一级有序列表的第二项。
  + 二级有序列表。

- 无序列表项。
- 另一个无序列表项。

/ 概念: 用术语列表记录定义或关键词。
/ 备注: 术语和解释之间会自动保持合适的悬挂缩进。

== 图表

表格作为 `figure` 包裹时，表题会默认放在表格上方。

#figure(
  table(
    columns: 4,
    stroke: none,
    table.hline(),
    [t], [1], [2], [3],
    table.hline(stroke: .5pt),
    [y], [0.3s], [0.4s], [0.8s],
    table.hline(),
  ),
  caption: [三线表示例],
) <tbl:timing>

图片示例如 @fig:cover-small。

#figure(
  image("images/cover.jpg", width: 42%),
  caption: [封面图局部示例],
) <fig:cover-small>

== 数学公式

行内公式示例：$frac(2, x) = 1$。行间公式默认不编号，附录中可以启用独立编号。

$ f(x, y) := cases(
  1 "if" (x dot y) / 2 <= 0,
  2 "if" x "is even",
  3 "else",
) $

== 定理环境

#show: thmrules

#theorem("勾股定理")[
  在直角三角形中，两条直角边平方和等于斜边平方。
] <thm:pythagorean>

#proof[
  可以通过面积分割或相似三角形证明 @thm:pythagorean。
]

#definition("模板入口")[
  `documentclass` 返回一组已经绑定全局配置的页面和布局函数。
]

= 自定义入口

== 封面与目录

封面图片通过 `cover-image` 控制；不需要封面图时传入 `none`。目录页可以配置显示深度、页码样式和目录标题是否进入目录。

````typ
#cover()
#outline-page(
  depth: 3,
  outlined: false,
  page-numbering: "I",
)
````

== 字体

字体集中配置在 `utils/font-style.typ`。如果字体展示页缺字或报错，可以运行 `typst fonts` 查看本机可用字体，再替换对应字体族。

#show: appendix.with(
  title: [附录],
  figure-numbering: "A.1",
  equation-numbering: "(A.1)",
)

= 第三方包清单

+ `outrageous:0.4.0`：目录样式。
+ `cuti:0.3.0`：中文伪加粗。
+ `ctheorems:1.1.3`：定理环境。
+ `codly:1.3.0` 与 `codly-languages:0.1.1`：代码块高亮。
+ `i-figured:0.2.4`：附录中的图表和公式编号。

= 附录公式与图表

附录中的标题计数会重新开始，图表和行间公式也可以使用独立编号。

#figure(
  table(
    columns: 2,
    [符号], [含义],
    [$A$], [附录中的集合],
  ),
  caption: [附录表格],
)

$ sum_(i=1)^n i = n(n + 1) / 2 $
