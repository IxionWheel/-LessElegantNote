// 正文设置。在这里修改正文的字体、字号等。

// 第三方包
// #import "@preview/i-figured:0.2.4"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
// 放在其他文件中的小工具
#import "../utils/font-style.typ": 字体, 字号
#import "../utils/heading.typ": custom-numbering,get-heading-args


#let mainmatter(
  // documentclass 传入参数
  twoside: false,
  info: (:),
  // 正文相关
  text-font: 字体.宋体, // 正文字体
  text-size: 字号.五号, // 正文字号
  par-leading: 7pt, // 行距
  par-spacing: 7pt, // 段间距
  strong-font: 字体.宋体, // strong类型字体
  // 标题相关
  // style-name: "maths", // 标题类型

  heading-fill: (rgb("#004578"), rgb("#004578"), rgb("#005a9e"), rgb("#005a9e")), // 标题颜色
  // 其他参数
  strong-color: rgb("#106ebe"), // strong类型强调的颜色
  ..args,
  it,
) = {
  // 0.  默认参数
  // info = (
  //   (
  //     // style-name: "maths", // 标题类型
  //   )
  //   + info
  // )

  let color-blue = (rgb("#004578"), rgb("#005a9e"), rgb("#106ebe"), rgb("#0078d4"), rgb("#2b88d8"))

  let heading-args=get-heading-args(info.style-name)


  // 辅助函数
  let array-at(arr, pos) = {
    arr.at(calc.min(pos, arr.len()) - 1)
  }

  let unpairs(pairs) = {
    let dict = (:)
    for pair in pairs {
      dict.insert(..pair)
    }
    dict
  }

  // 1. 设置文本和段落样式
  // 1.1 普通文本
  set text(font: text-font, size: text-size)

  set par(leading: par-leading, justify: true, first-line-indent: (amount: 2em,all: true), spacing: par-spacing)

  

  // 1.2 特殊类型文本
  // 下划线
  set underline(offset: .15em, stroke: .05em, evade: false)
  
  // 代码块
  show: codly-init.with()
  codly(display-name: true) // 是否在代码块右上角显示语言名

  // 特殊格式：加粗strong、强调emph、原生raw
  show emph: it => {
    set text(weight: "bold")
    it
  }

  show strong: it => {
    set text(strong-color) // font: strong-font
    it
  }

  show raw: it => {
    set text(font: 字体.楷体,size: 字号.小五)// size: 字号.五号
    it
  }

  // 2. 标题
  // 设置标题的编号numbering
  set heading(numbering: custom-numbering.with(style: info.style-name))

  // 设置标题的字体、字号、间距
  show heading: it => {
    set text(
      font: array-at(heading-args.font, it.level),
      size: array-at(heading-args.size, it.level),
      weight: array-at(heading-args.weight, it.level),

      fill: array-at(heading-fill, it.level),

    )
    set block(
      above: array-at(heading-args.above, it.level), 
      below: array-at(heading-args.below, it.level))
    it
  }

  // 标题居中与自动换页
  show heading: it => {
    if (array-at(heading-args.pagebreak, it.level)) {
      // 如果打上了 no-auto-pagebreak 标签，则不自动换页
      if ("label" not in it.fields() or str(it.label) != "no-auto-pagebreak") {
        pagebreak(weak: true)
      }
    }
    if (array-at(heading-args.align, it.level) != auto) {
      set align(array-at(heading-args.align, it.level))
      it
    } else {
      it
    }
  }

  // 3. 列表
  // 3.1 无序列表 list
  // set par(first-line-indent: 0em)
  set list(indent: 2.3em, body-indent: 0.4em) //marker: ("‣","•","-")
  show list: it => {
    set block(above: par-leading, below: par-leading)
    it
  }
  // 3.2 有序列表 enum
  set enum(indent: 2em, body-indent: 0.25em, numbering: "1 ① i.")
  show enum: it => {
    set block(above: par-leading, below: par-leading)
    it
  }
  // 3.3 术语列表 terms
  set terms(indent: 2em, hanging-indent: 2.2em, separator: " ")
  show terms: it => {
    set block(above: par-leading, below: par-leading)
    it
  }

  // 4. 其他
  // 4.1 图表 figure
  show figure: it => {
    set block(breakable: true) // 设置图表的跨页展示
    it
  }
  // show heading: i-figured.reset-counters
  // show figure: i-figured.show-figure // figure 的编号

  show figure.where(kind: table): set figure.caption(position: top) // 表格表头置顶
  set figure.caption(separator: "  ") // 表头不用冒号用空格分割
  show figure.caption: set text(font: 字体.宋体, size: 字号.小五) // 表头样式

  // 4.2 表格 table
  set table(align: center + horizon)

  // 4.3 数学公式
  // 设置 equation 的编号和假段落首行缩进
  // show math.equation.where(block: true): i-figured.show-equation
  set math.equation(numbering: none)
  show math.equation: it => {
    set text(font: 字体.数学)
    h(0.2em)
    it
    h(0.1em)
  }

  // 4.4 页脚
  // 设置脚注
  show footnote.entry: set text(font: 字体.宋体, size: 字号.五号)

  // 设置页码
  set page(footer: context [
    #set align(center)
    #set text(font: 字体.宋体)
    #text(counter(page).display("1"))
  ])
  counter(page).update(1)

  // 
  it
}
