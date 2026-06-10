// Central defaults for LessElegantNote.

#import "font-style.typ": 字号, 字体

#let default-info = (
  title: "LessElegantNote：一个Typst笔记模版",
  author: "choglost",
  date: datetime.today(),
  cover-image: none,
  style-name: "maths",
)

#let doc-defaults = (
  fallback: true,
  lang: "zh",
  margin: (x: 40pt, y: 50pt),
)

#let mainmatter-defaults = (
  text-font: 字体.宋体,
  text-size: 字号.五号,
  par-leading: 7pt,
  par-spacing: 7pt,
  strong-font: 字体.宋体,
  strong-color: rgb("#106ebe"),
  heading-fill: (rgb("#004578"), rgb("#004578"), rgb("#005a9e"), rgb("#005a9e")),
)

#let outline-page-defaults = (
  title: "目　录",
  outlined: false,
  title-level: 1,
  depth: 3,
  page-numbering: "I",
  reset-page-counter: true,
  title-vspace: 12pt,
  title-text-args: (font: 字体.黑体, size: 字号.三号),
  reference-font: 字体.宋体,
  reference-size: 字号.小五,
  entry-fonts: (字体.黑体, 字体.宋体, 字体.宋体, 字体.宋体, 字体.宋体, 字体.宋体),
  entry-fill: (auto,),
  vspace: (6pt, 4pt),
)

#let appendix-defaults = (
  title: none,
  title-outlined: true,
  title-numbering: none,
  numbering: "A.1",
  figure-numbering: "A.1",
  equation-numbering: "(A.1)",
  show-figure: auto,
  show-equation: auto,
  reset-heading-counter: true,
)

#let defaults = (
  info: default-info,
  doc: doc-defaults,
  mainmatter: mainmatter-defaults,
  outline-page: outline-page-defaults,
  appendix: appendix-defaults,
)
