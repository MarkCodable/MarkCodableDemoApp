# MarkCodingDemoApp

This is a demo app that showcases a simple dynamic affiliate store app for iPhone built in about 70 lines of code with a backend driven by a single Markdown file.

![](https://raw.githubusercontent.com/icanzilb/MarkCodingDemoApp/main/etc/app-screen.png)

The `MarkCoding` persistence format revolves around it being plain text easily editable by humans. This repo showcases a simple setup for an affiliate iPhone app store:

- GitHub hosts a Markdown file with products, editable online.
- An iOS app that fetches the file and displays the products.
- Amazon fulfills any purchases and tracks affiliate fees.

GitHub takes care of hosting, file versioning, access permissions, and more:

![](https://raw.githubusercontent.com/icanzilb/MarkCodingDemoApp/main/etc/editing-markdown.png)

https://github.com/icanzilb/MarkCodingDemoApp/blob/main/books.md

The Swift code fetches the Markdown from GitHub and decodes the products with a single `MarkDecoder.decode(...)` call to display a list of products:

![](https://raw.githubusercontent.com/icanzilb/MarkCodingDemoApp/main/etc/iphone-app.png)

Finally, when the user taps one of the products they are sent to the product detail page on Amazon:

![](https://raw.githubusercontent.com/icanzilb/MarkCodingDemoApp/main/etc/buy.png)

Clone the repo and give the app a try!

## Credits

MIT License, Marin Todorov (2022)

[@icanzilb on Twitter](https://twitter.com/icanzilb)
