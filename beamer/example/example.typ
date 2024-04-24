#import "../beamer.typ" : beamer

#show: beamer.with(
  title: "Title page",
  author: "author",
  date: [#datetime.today().display(" [Month repr:numerical], [day] [year]")],
  end: "End Slide",
)


= Title part
== 1 slide
#figure(image("../../.picture/logo.png", height:  50%))
== 2 slide
