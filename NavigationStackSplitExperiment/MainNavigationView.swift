//
//  MainNavigationView.swift
//  NavigationStackSplitExperiment
//
//  Created by Eric Kampman on 4/25/24.
//

import SwiftUI

struct MainNavigationView: View {
	@State var library = Library.setData()
	@State private var navigationPath = NavigationPath()

    var body: some View {
		NavigationSplitView {
			VStack {	// for navigationDestinations
				VStack(alignment: .leading) {
					Text("Books")
						.font(.title2)
					List(library.books) { book in
						NavigationLink(book.title, value: book)
					}
					.navigationDestination(for: Book.self) { book in
						BookView(book: book, navigationPath: $navigationPath)
					}
					.navigationDestination(for: Author.self) { author in
						AuthorView(author: author, navigationPath: $navigationPath)
					}
				}
				.padding([.bottom], 10)
				
				VStack(alignment: .leading) {
					Text("Authors")
						.font(.title2)
					List(library.authors) { author in
						NavigationLink(author.id, value: author)
					}
					.navigationDestination(for: Author.self) { author in
						AuthorView(author: author, navigationPath: $navigationPath)
					}
				}
				.padding([.bottom], 10)
			}
		} content: {
			Text("Content")
		} detail: {
			Text("Detail")
		}

    }
}

#Preview {
    MainNavigationView()
}
