// 封面页

#import "../utils/font-style.typ": 字号, 字体
#import "../utils/config.typ": default-info
#import "../utils/internal.typ": title-lines

#let elegant-cover(
  // documentclass 传入的参数
  twoside: false,
  info: (:),
  // datetime-display: datetime-display,
) = {
  // 1.  默认参数
  info = default-info + info

  // 2.  对参数进行处理
  // 处理提交日期
  if type(info.date) == datetime {
    info.date = info.date.display("[year]/[month]/[day]")
  }
  // // 如果是字符串，则使用换行符将标题分隔为列表
  info.title = title-lines(info.title)

  // 3.  正式渲染
  // 双面打印模式
  // pagebreak(weak: true, to: if twoside { "odd" })

  set page(margin: 0pt)

  if info.cover-image != none {
    image(info.cover-image, width: 100%, height: 55%)
    v(20pt)
  } else {

  }

  set align(horizon)

  for s in range(info.title.len()) {
    text(font: 字体.宋体, size: 字号.一号)[#h(40pt)*#info.title.at(s)*]
    v(20pt)
  }

  text(font: 字体.楷体, size: 字号.小四)[#h(50pt)作者：#info.author]
  v(0pt)
  if (info.date != none) {
    text(font: 字体.楷体, size: 字号.小四)[#h(50pt)日期：#info.date]
  }
  v(50pt)
}
