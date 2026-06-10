// 文稿设置。可以进行一些全局设置，如页面边距 margin

#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "../utils/config.typ": default-info, doc-defaults
#import "../utils/internal.typ": title-lines, title-text


#let doc(
  // documentclass 传入参数
  info: (:),
  // 其他参数
  fallback: doc-defaults.fallback,  // 字体缺失时使用 fallback，不显示豆腐块
  lang: doc-defaults.lang,
  margin: doc-defaults.margin, // 页边距
  it,
) = {
  // 1.  默认参数
  info = default-info + info

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  info.title = title-lines(info.title)
  // 3.  设置PDF 元信息
  set document(
    title: title-text(info.title),
    author: info.author,
  )
  // 4.  基本的样式设置
  show: show-cn-fakebold // 中文伪加粗，来自cuti包

  set page(margin: margin) // 设置页边距
  set text(fallback: fallback, lang: lang)

  it
}
