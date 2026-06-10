// 目录页。设置“目录页”的布局和内容。
// 如果要更改字体、字号等内容，直接修改参数列表相关项

#import "@preview/outrageous:0.4.0"
#import "../utils/font-style.typ": 字体
#import "../utils/config.typ": outline-page-defaults
#import "../utils/internal.typ": page-number-footer

// 创建一个不可见的标题，用于给 outline 加上短标题
#let invisible-heading(..args) = {
  set text(size: 0pt, fill: white)
  heading(numbering: none, ..args)
}

// 目录生成
#let outline-page(
  // documentclass 传入参数
  twoside: false,
  // 其他参数
  title: outline-page-defaults.title, // 目录页的大标题
  outlined: outline-page-defaults.outlined, //目录页自身是否出现在目录中
  title-level: outline-page-defaults.title-level,
  depth: outline-page-defaults.depth, // 显示到几级标题
  page-numbering: outline-page-defaults.page-numbering,
  reset-page-counter: outline-page-defaults.reset-page-counter,
  title-vspace: outline-page-defaults.title-vspace, // 大标题与具体目录的垂直间距
  title-text-args: outline-page-defaults.title-text-args, // “目录”大标题的字体、字号
  reference-font: outline-page-defaults.reference-font,// 默认字体（标题引用和页数）
  reference-size: outline-page-defaults.reference-size,// 默认字号
  entry-fonts: outline-page-defaults.entry-fonts,
  entry-fill: outline-page-defaults.entry-fill,
  vspace: outline-page-defaults.vspace,// 目录行距，较为紧凑
  ..args,
) = {
  // 与封面之间是否有空白页，用于双面打印
  pagebreak(weak: true, to: if twoside { "odd" }) 
  
  // 目录页的页码
  if page-numbering != none {
    set page(footer: page-number-footer(numbering: page-numbering, font: 字体.宋体))
    if reset-page-counter {
      counter(page).update(1)
    }
  }

  // 设置目录页大标题
  if title != none {
    set align(center)
    text(..title-text-args, title)
    invisible-heading(level: title-level, outlined: outlined, title)
    v(title-vspace)
  }

  set text(font: reference-font, size: reference-size)
  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.typst,// 保留 Typst 基础样式
    
    font: entry-fonts, // 各级标题字体
    vspace: vspace, // 行间距
    fill: entry-fill, // 各级标题到页码间的填充

    // TODO：修改分级缩进、字号，或者取消导入outrageous包自己实现
  )

  // 显示目录
  outline(title: none, depth: depth, ..args)
}
