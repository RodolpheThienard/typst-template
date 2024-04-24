# Typst template

## Beamer
### Use template
```typ
#import "beamer.typ" : beamer

#show: beamer.with(
  title: "Title page",
  author: "author",
  date: [#datetime.today().display(" [Month repr:numerical], [day] [year]")],
  end: "End Slide",
)
```

### Render
<details>
<summary>Outline</summary>
<img title="a title" alt="Alt text" src=".picture/outline.jpg">
</details>
<details>
<summary>Section</summary>
<img title="a title" alt="Alt text" src=".picture/section.jpg">
</details>
<details>
<summary>Slide</summary>
<img title="a title" alt="Alt text" src=".picture/slide.jpg">
</details>


