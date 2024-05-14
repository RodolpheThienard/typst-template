#import "template2.typ" : project

#show: project.with(
  title: "Title",
  subtitle: "Subtitle",
  img: "images/logo.png",
  authors: (
    (
      name: "Name",
      affiliation: "Affiliation",
      email: "Email",
    ),
  ),
)
