#let project(title: none, authors: none, subtitle: none, img:none, body) = {
  set text(font: "IBM Plex Mono", lang: "en")
  set par(justify: true)
  set page(
    header: grid(columns: (1fr), 
      align(right + horizon)[#text(gray)[#title]], 
    ),
    footer: [
      #line(length: 100%)
      #grid(columns: (50%,50%),
        align(left)[#text(gray)[#datetime.today().display("[Month repr:long] [day], [year]")]],
        align(right,  counter(page).display("1/1", both: true)))
      ]
     
  )
  

  let number-until-with(max-level, schema) = (..numbers) => {
    if numbers.pos().len() <= max-level {
      numbering(schema, ..numbers)
    }
  }

  set heading(numbering: number-until-with(1, "I.a"))
  show raw.where(block: true): it => {
      set text(font: "IBM Plex Mono", size: 8pt)
      set align(left)
      set block(fill: luma(240), inset: 10pt, radius: 4pt, width: 100%,stroke: rgb("#000").lighten(80%),)
      it
  }
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt
  )
  show raw.where(block: false): text.with(font: "IBM Plex Mono")

// TITLE
    grid(columns: (30%, 70%), column-gutter: 10pt,
  align(left + horizon, image(img)),
      align(left + horizon)[#text(18pt, fill: rgb("#007ba4"), [*#title*])\
        #text(14pt, fill: maroon)[#subtitle]\
        #grid(
          columns: (1fr,) * 2,
          row-gutter: 24pt,
          ..authors.map(author => [
            #author.name \
            #author.affiliation \
            #if author.email != none [
              #link("mailto:" + author.email)]
          ]),)],)

  line(length: 100%)

  columns(1,body)
}
