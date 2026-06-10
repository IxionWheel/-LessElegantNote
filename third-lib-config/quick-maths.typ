#import "@preview/quick-maths:0.2.1": shorthands

// Shorthand for vectors
#let va = $bold(a)$
#let vb = $bold(b)$
#let vx = $bold(x)$
#let vy = $bold(y)$
#let vz = $bold(z)$
#let vv = $bold(v)$
#let vw = $bold(w)$
#let ve = $bold(e)$

// Mapping arrow
// #let mapsto = $arrow.r.bar$

// Operators
#let grad = x => $nabla #x$
#let ip = (x, y) => $angle.l #x, #y angle.r$
#let pp = (x, y) => $(diff #x) / (diff #y)$
#let dd = (x, y) => $(d #x) / (d #y)$
#let Df = $D f$
#let Dg = $D g$
#let DT = $D T$

#show: shorthands.with(
  ($+-$, math.plus.minus),
  ($|-$, math.tack),
  ($<=$, math.arrow.l.double), // '≤'
  ($|>$,math.arrow.r.bar)
)
