// Heading styles and numbering rules.

#import "font-style.typ": 字体, 字号
#import "internal.typ": array-at

#let skip-next-heading-pagebreak = state("less-elegant-note-skip-next-heading-pagebreak", false)

#let heading-styles = (
  maths: (
    style-name: "maths",
    numbering: ("1  ", "1.1 ", "　1.1.1 ", "　　(1)", "　　1)", "　　a)"),
    numbering-mode: "full-up-to-3",
    font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体),
    size: (字号.三号, 字号.四号, 字号.小四, 字号.五号, 字号.五号, 字号.五号),
    weight: ("bold", "regular", "regular", "regular", "regular", "regular"),
    above: (20pt, 16pt, 14pt, 10pt, 7pt, 7pt),
    below: (20pt, 14pt, 10pt, 8pt, 7pt, 7pt),
    pagebreak: (true, false),
    align: (center, auto),
  ),
  literature: (
    style-name: "literature",
    numbering: ("第一章 ", "第一节 ", "一、", "　(一)", "　(1)", "　1)"),
    numbering-mode: "last",
    font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体),
    size: (字号.三号, 字号.四号, 字号.小四, 字号.五号, 字号.五号, 字号.五号),
    weight: ("bold", "regular", "regular", "regular", "regular", "regular"),
    above: (20pt, 16pt, 14pt, 10pt, 7pt, 7pt),
    below: (20pt, 14pt, 10pt, 8pt, 7pt, 7pt),
    pagebreak: (true, false),
    align: (center, auto),
  ),
  book: (
    style-name: "book",
    numbering: ("第一篇 ", "第一章 ", "第一节 ", "一、", "　(一)", "　(1)"),
    numbering-mode: "last",
    font: (字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体, 字体.黑体),
    size: (字号.三号, 字号.四号, 字号.小四, 字号.五号, 字号.五号, 字号.五号),
    weight: ("bold", "regular", "regular", "regular", "regular", "regular"),
    above: (20pt, 16pt, 14pt, 10pt, 7pt, 7pt),
    below: (20pt, 14pt, 10pt, 8pt, 7pt, 7pt),
    pagebreak: (true, false),
    align: (center, center, auto),
  ),
)

#let get-heading-args(style: "maths") = {
  heading-styles.at(style, default: heading-styles.maths)
}

#let custom-numbering(style: "literature", ..args) = {
  let heading-style = get-heading-args(style: style)
  let level = args.pos().len()
  let numbering-style = array-at(heading-style.numbering, level)
  let use-full-number = heading-style.numbering-mode == "full-up-to-3" and level <= 3

  if use-full-number {
    numbering(numbering-style, ..args)
  } else {
    numbering(numbering-style, args.pos().last())
  }

  return
}
