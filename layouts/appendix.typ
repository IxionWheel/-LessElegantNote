#import "@preview/i-figured:0.2.4"
#import "../utils/config.typ": appendix-defaults
#import "../utils/heading.typ": skip-next-heading-pagebreak

// 附录设置，重置标题计数器，并可单独配置图表和公式编号。
#let appendix(
  twoside: false,
  title: appendix-defaults.title,
  title-outlined: appendix-defaults.title-outlined,
  title-numbering: appendix-defaults.title-numbering,
  numbering: appendix-defaults.numbering,
  figure-numbering: appendix-defaults.figure-numbering,
  equation-numbering: appendix-defaults.equation-numbering,
  show-figure: appendix-defaults.show-figure,
  show-equation: appendix-defaults.show-equation,
  reset-heading-counter: appendix-defaults.reset-heading-counter,
  it,
) = {
  let figure-rule = if show-figure == none {
    it => it
  } else if show-figure == auto {
    i-figured.show-figure.with(numbering: figure-numbering)
  } else {
    show-figure
  }
  let equation-rule = if show-equation == none {
    it => it
  } else if show-equation == auto {
    i-figured.show-equation.with(numbering: equation-numbering)
  } else {
    show-equation
  }

  pagebreak(weak: true, to: if twoside { "odd" })

  set heading(numbering: numbering)
  show figure: figure-rule
  show math.equation.where(block: true): equation-rule

  if reset-heading-counter {
    counter(heading).update(0)
  }

  if title != none {
    heading(level: 1, numbering: title-numbering, outlined: title-outlined)[#title]
    if reset-heading-counter {
      counter(heading).update(0)
    }
    skip-next-heading-pagebreak.update(true)
  }

  it
}
