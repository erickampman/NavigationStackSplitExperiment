//
//  BookView.swift
//  NavigationStackExperiment
//
//  Created by Eric Kampman on 4/25/24.
//

import SwiftUI

struct BookView: View {
	var book: Book
	@Binding var navigationPath: NavigationPath
	var body: some View {
		HStack {
			Text(book.title)
			Text("by")
// The author name gets truncated.
// This works, but sucks for localizing.
			NavigationLink(book.author.id, value: book.author)
				.frame(width: 200)
				.navigationDestination(for: Author.self) { author in
					AuthorView(author: author, navigationPath: $navigationPath)
				}

// doesn't help:
//			NavigationLink(value: book.author) {
//				Button {
//				} label: {
//					Text(book.author.id)
//				}
//			}
			
//			Button {
//				navigationPath.append(book.author)
//			} label: {
//				Text("\(book.author.firstName) \(book.author.lastName)")
//					.frame(minWidth: 100) <-- this DOES help
//			}


// I gave up. this appears to be an Apple bug (in Sonoma).
// Sent Apple an isue via Feedback Assistant
//				Text("\(book.author.firstName) \(book.author.lastName)")
//					.frame(minWidth: 100)
//			}
		}
		.padding()
	}
}

#Preview {
	@State var navigationPath = NavigationPath()
	return BookView(book: Book(title: "My Book", author: Author(firstName: "Foo", lastName: "Barr")), navigationPath: $navigationPath)
}
