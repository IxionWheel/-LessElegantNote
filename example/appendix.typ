// Appendix smoke example for LessElegantNote.

#import "../lib.typ": *

#let (
  doc,
  mainmatter,
  appendix,
  outline-page,
) = documentclass(
  info: (
    title: "附录示例",
    author: "LessElegantNote",
    cover-image: none,
  ),
)

#show: doc
#outline-page()
#show: mainmatter

= 正文

正文内容。

#show: appendix.with(
  title: [附录],
  figure-numbering: "A.1",
  equation-numbering: "(A.1)",
)

= 附录资料

这个标题应紧跟“附录”总标题之后，不应被额外空白页隔开。

#figure(
  table(
    columns: 2,
    [项目], [说明],
    [A], [附录表格],
  ),
  caption: [附录表格],
)

$ sum_(i=1)^n i = n(n + 1) / 2 $
