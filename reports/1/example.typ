#import "template1.typ": template

#show: doc => template(
  title: [
    *Template 1 *
  ],
  subtitle: "Subtitle",
  subsubtitle: none,
  authors: (
    (
      name: "Name 1",
    ),
    (
      name: "Name 2",
    ), 
    (
      name: "Name 3",
    ),
    (
      name: "Name 4",
    ),
  ),
  abstract: [#lorem(100)],
  doc,
)
