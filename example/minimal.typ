// Minimal smoke example for LessElegantNote.

#import "../lib.typ": *

#let (
  doc,
  mainmatter,
  cover,
  outline-page,
) = documentclass(
  info: (
    title: "最小示例",
    author: "LessElegantNote",
    cover-image: none,
  ),
)

#show: doc
#cover()
#outline-page()
#show: mainmatter

= 第一章

这是一份最小示例，用来检查模板入口、封面、目录和正文布局是否能正常工作。

== 二级标题

正文默认使用五号宋体、首行缩进、两端对齐，并保留当前模板的标题样式。
