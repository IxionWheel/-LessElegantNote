// 第三方包 定理
#import "@preview/ctheorems:1.1.3": *

#let bodyfmt = (body) => [
  #body

  // 务必不要删除上面的空行！
]

#let noindent = context {
    let indent = par.first-line-indent
    let amount = if type(indent) == dictionary {
      indent.at("amount", default: 0pt)
    } else {
      indent
    }
    if amount != none and amount != 0pt {
      h(-amount)
    }
  }

#let boxtitlefmt = (title) => [
  #noindent
  *#title*
]

#let plaintitlefmt = (title) => [
  #noindent
  #emph(title)
]

// 定义定理环境
#let theorem = thmbox("theorem", "定理", fill: rgb("#e8e8f8"), titlefmt: boxtitlefmt, bodyfmt: bodyfmt,)
#let lemma = thmbox("theorem", "引理", fill: rgb("#efe6ff"), titlefmt: boxtitlefmt, bodyfmt: bodyfmt,) // 与Theorems共同计数
#let corollary = thmbox("corollary", "推论", base: "theorem", fill: rgb("#f8e8e8"), titlefmt: boxtitlefmt, bodyfmt: bodyfmt,)// 'Attached' to Theorems

#let definition = thmbox("definition", "定义", fill: rgb("#e8f8e8"), titlefmt: boxtitlefmt, bodyfmt: bodyfmt,)// 单独计数

#let exercise = thmbox("exercise", "习题", stroke: rgb("#ffaaaa") + 1pt, base: none, titlefmt: boxtitlefmt, bodyfmt: bodyfmt,).with(numbering: "I",) // 单独计数

// Examples and remarks are not numbered
#let example = thmplain("example", "例", titlefmt: plaintitlefmt, bodyfmt: bodyfmt,).with(numbering: none,)
#let remark = thmplain("remark", "注", inset: 0em, titlefmt: plaintitlefmt, bodyfmt: bodyfmt,).with(numbering: none)

#let proof = thmproof("proof", "证明", base: "theorem", titlefmt: plaintitlefmt, bodyfmt: bodyfmt,)

#let solution = thmplain("solution","答", base: "exercise", inset: 0em, titlefmt: plaintitlefmt, bodyfmt: bodyfmt,).with(numbering: none)


