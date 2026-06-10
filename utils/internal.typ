// Internal helpers shared by layouts and pages.

#let array-at(arr, pos, default: auto) = {
  if arr.len() == 0 {
    default
  } else {
    arr.at(calc.min(calc.max(pos, 1), arr.len()) - 1)
  }
}

#let title-lines(title) = {
  if type(title) == str {
    title.split("\n")
  } else {
    title
  }
}

#let title-text(title) = {
  let lines = title-lines(title)
  if type(lines) == array {
    (("",) + lines).sum()
  } else {
    lines
  }
}

#let named-info(args) = {
  args.named().at("info", default: (:))
}

#let merge-named-info(base-info, args) = {
  base-info + named-info(args)
}

#let page-number-footer(numbering: "1", font: auto) = context {
  let page-number = counter(page).display(numbering)
  if font == auto {
    align(center, page-number)
  } else {
    align(center, text(font: font)[#page-number])
  }
}
