# Beamer in typst

## Use template
```typ
#import "template-diapo.typ" : beamer

#show: beamer.with(
  title: "Title page",
  author: "author",
  date: [#datetime.today().display(" [Month repr:numerical], [day] [year]")],
  end: "End Slide",
)
```

## Render
<details>
<summary>Outline</summary>
<img title="a title" alt="Alt text" src=".picture/outline.png">
</details>
<details>
<summary>Section</summary>
<img title="a title" alt="Alt text" src=".picture/section.png">
</details>
<details>
<summary>Slide</summary>
<img title="a title" alt="Alt text" src=".picture/slide.png">
</details>


