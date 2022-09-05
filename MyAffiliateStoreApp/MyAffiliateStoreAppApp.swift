//  Created by Marin Todorov on 9/3/22.

import SwiftUI
import MarkCodable

struct Book: Codable, Identifiable {
    var id: String { title }
    let featured: Bool
    let title: String
    let author: String?
    let imageURL: URL
    let purchaseURL: URL
}

@main
struct MyAffiliateStoreAppApp: App {
    @State var status = "Loading..."
    @State var books = [Book]()
    @Environment(\.openURL) private var openURL

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if books.isEmpty {
                    VStack {
                        Text(status)
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    .task {
                        do {
                            let markdown = try String(contentsOf: URL(string: "https://raw.githubusercontent.com/icanzilb/MarkCodingDemoApp/main/books.md")!)
                            books = try MarkDecoder()
                                .decode([Book].self, string: markdown)
                                .sorted(by: { $0.featured && !$1.featured })
                        } catch {
                            status = "\(error)"
                        }
                    }
                } else {
                    List(books) { book in
                        VStack(alignment: .leading) {
                            HStack {
                                AsyncImage(
                                    url: book.imageURL,
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 100, maxHeight: 100)
                                    },
                                    placeholder: { EmptyView().frame(width: 100, height: 100) }
                                )

                                VStack(alignment: .leading) {
                                    Text(book.title).bold()
                                    if let author = book.author {
                                        Text(author).font(.caption)
                                    }
                                    Button { openURL(book.purchaseURL) } label: { Text("Buy book") }
                                        .buttonStyle(.bordered)
                                        .padding(.top, 6)
                                }

                                Spacer()
                            }
                        }
                        .padding(4)
                        .background(book.featured ? Color(red: 0.95, green: 0.98, blue: 1) : .clear)
                    }
                    .navigationTitle("Books")
                }
            }
        }
    }
}
