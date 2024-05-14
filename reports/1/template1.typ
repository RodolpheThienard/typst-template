#let date = datetime(
  year: 2024,
  month: 01,
  day: 29,
)


#let template(
  title: none,
  subtitle: none,
  subsubtitle: none,
  authors: (),
  abstract: [],
  doc,
) = {
  set page(numbering: "1/1")
  set text(font: "Linux Libertine", lang: "en", size: 11pt)
  set heading(numbering: "1.1", outlined: true)
  set align(center)

grid(
  columns: (1fr, 1fr, 1fr),
  align(left)[
    #image("images/arm_logo.png", width: 70%)
  ],
  align(center)[],
  align(right)[
    #v(0.4cm)
    #figure( image("images/teratec-logo.jpg", width: 60%))
  ]
)

align(
  center,
  text(24pt)[
  #subtitle
  ]
)
align(
  center,
  text(18pt)[#subsubtitle]
)
  

  line(length: 100%)
  align(center, text(32pt, title))
  line(length: 100%)

  v(1em)

  align(center, box(align(start, text(16pt)[
      *Authors:* \
    ])))
      grid(
    columns: (1fr,) * 2, 
    row-gutter: 16pt,
    ..authors.map(author => text(16pt)[
      #author.name \
    ]),
  
)

if(abstract != none){
  v(1em)
  align(center, box(align(start, text(16pt)[
      *Abstract:* \
    ])))
  [#abstract]
}
  
  align(center + bottom, text(16pt)[#date.display("[month repr:long] [day], [year]")])
  set par(justify: true)
  set align(left)
  
  columns(1, doc)
}

