#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let symbol-mindmap(
  data, 
  symbol: "+", 
  column-spacing: 20mm, 
  row-spacing: 1.5,
  node-width: 120pt, 
) = {
  let raw-text = if type(data) == str { data } else { data.text }
  let lines = raw-text.trim().split("\n").filter(l => l.trim().len() > 0)
  
  let items = lines.map(line => {
    let line-content = line.trim()
    let pattern = regex("^\\" + symbol + "+")
    let m = line-content.match(pattern)
    if m == none { panic("行必须以符号开头: " + line) }
    let level = m.text.len()
    let content = line-content.slice(m.end).trim()
    (level: level, content: content)
  })

  let colors = (blue.lighten(85%), orange.lighten(85%), green.lighten(85%), red.lighten(95%))

  let walk(idx, y_map) = {
    let curr = items.at(idx)
    let my_level = curr.level
    
    // --- 核心修复：精准寻找直接子节点 ---
    let child_indices = ()
    let j = idx + 1
    while j < items.len() {
      if items.at(j).level <= my_level { break } // 遇到同级或上级，彻底停止
      
      // 只有恰好比当前层级多 1 级的才是“直接子节点”
      if items.at(j).level == my_level + 1 {
        child_indices.push(j)
      }
      j += 1
    }

    let current_nodes = ()
    let current_edges = ()
    let my_y = 0.0

    if child_indices.len() == 0 {
      my_y = y_map.at(str(my_level), default: 0.0)
      y_map.insert(str(my_level), my_y + row-spacing)
    } else {
      let child_ys = ()
      for c_idx in child_indices {
        let (cn, ce, updated_y, cy) = walk(c_idx, y_map)
        current_nodes += cn
        current_edges += ce
        y_map = updated_y
        child_ys.push(cy)
      }
      
      my_y = (child_ys.first() + child_ys.last()) / 2
      let cur_col_y = y_map.at(str(my_level), default: 0.0)
      y_map.insert(str(my_level), calc.max(cur_col_y, my_y + row-spacing))
      
      let parent_pos = (my_level - 1, my_y)
      for cy in child_ys {
        let diff = cy - my_y
        // 采用你喜欢的弧度方向
        let b = - diff * 5deg +0.1deg
        current_edges.push(edge(parent_pos, (my_level, cy), "-", bend: b))
      }
    }
    
    let fill_color = colors.at(calc.min(my_level - 1, colors.len() - 1))
    
    // 支持换行符处理
    let node-content = curr.content.split("\ ").join(linebreak())
    
    let n = node(
      (my_level - 1, my_y), 
      align(center, box(width: node-width, node-content)), 
      fill: fill_color,
      stroke: 0.5pt + gray,
      corner-radius: 5pt
    )
    current_nodes += (n,)
    
    (current_nodes, current_edges, y_map, my_y)
  }

  // 入口逻辑
  let all_n = ()
  let all_e = ()
  let master_y_map = (:)
  let min_level = items.map(it => it.level).dedup().sorted().first()
  let root_indices = range(items.len()).filter(i => items.at(i).level == min_level)

  for r_idx in root_indices {
    let (nodes, edges, updated_y, _) = walk(r_idx, master_y_map)
    all_n += nodes
    all_e += edges
    master_y_map = updated_y
  }

  diagram(
    spacing: (column-spacing, 2mm),
    node-shape: fletcher.shapes.pill,
    ..all_n, ..all_e
  )
}