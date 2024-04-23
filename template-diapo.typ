#let main_color = rgb("663399") 
#let transition_color = rgb("663399") 
#let backgroung_start = none

#let beamer_start( title:none, subtitle:none, author:none, date:none) = {
  page(
    margin: (top:5%, bottom: 5%, left: 5%, right:5%),
    background:none, // image(backgroung_start),
    header: none
  )[
      #align(center+horizon, text(25pt, weight: "bold", title))
      #align(center+horizon, text(17pt, weight: "regular", author))
      #align(right+bottom, text(15pt, date))
    
  ] 
}


#let beamer_catalogs() = {
  set page(
    margin: (top:0%, bottom: 0%, left: 0%, right:10%),
  )
  set outline(
      title: none,
      depth: 2,
      indent: 2em,
      fill: none
  )
  show outline.entry.where(level:1): it => {
    v(30pt, weak: true)
    text(fill: main_color.lighten(10%), size: 20pt, weight: "bold",it)
  }
  show outline.entry.where(level:2):it => {
    text(fill: main_color.lighten(10%),size: 15pt, weight: "regular",it)
  }
  grid(
    columns:(35%, 70%),
    column-gutter: 16%,
    align(
      center+horizon, 
      box(
        fill: main_color,
        width: 100%,
        height: 100%,
        text(fill: white, size: 40pt, hyphenate: true, weight: "bold", [Outline])
      ),
    ),
    align(center+horizon, outline())
  )  
}

#let beamer_content(body) = {
  set page(
    margin: (top:20%, bottom: 10%, left: 5%, right:5%),
    footer: [
			#let lastpage-number = locate(pos => counter(page).final(pos).at(0))
			#set align(right)
			#text(size: 10pt)[
				#counter(page).display("1")
				\/ #lastpage-number
			]
		],
    header: locate(loc => {
      let title = query(heading.where(level:1).before(loc),loc).last().body
      grid(
        rows:(70%, 10%),
        row-gutter: 0%,
        grid(
          columns:(50%, 50%),
          align(left+horizon, text(fill: main_color,   size: 25pt, weight: "bold", title)),
          align(left+horizon, box(height: 100%, width:100%)),
        ),
        align(center+bottom, line(length: 100%, stroke: (paint:main_color, thickness:1pt)))
      )
    })
  )

  show heading.where(level:1):it => {
    set page(
      margin: (top:5%, bottom: 10%, left: 5%, right:5%),
      fill: transition_color,
      header: none, 
      background: none
    )
    align(center+horizon, text(fill: white, size: 40pt, it))
  }

  show heading.where(level:2): it => {
    locate( loc => {
      let level_1_now_title = query(heading.where(level:1).before(loc),loc).last().body
      let level_2_now_title = query(heading.where(level:2).before(loc),loc).last().body
    
      let first_title = none
      let get = false
      for item in query(heading.where(level:1).or(heading.where(level:2)),loc) {
        if get {
          if item.level == 2 {
            first_title = item.body
          }
          break
        } else {
          if item.level == 1 and item.body == level_1_now_title {
            get = true
          }
        }
      }
      
      if first_title != level_2_now_title {
        pagebreak()
      }
    })
    align(top, text(size: 20pt, it))
    v(1em)
  }
  body
}

#let beamer_end(end) = {
  set page(fill: main_color)
  set align(left+horizon)
  text(40pt, weight: "bold", fill: white, end )
}

#let beamer( title:none, subtitle:none, author:none, date:none, end:none, body) = {
  set page(
    paper: "presentation-16-9",
  )
  set text(font: "Linux Libertine", size:18pt, weight: "regular")
  beamer_start(title:title, author:author, date:date)
  beamer_catalogs()
  beamer_content(body)
  beamer_end(end)
}

