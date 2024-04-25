//
//  ContentView.swift
//  NavigationStackSplitExperiment
//
//  Created by Eric Kampman on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		MainNavigationView()
			.toolbar {
				Text("Library")
					.font(.title)
			}
	}
}

#Preview {
    ContentView()
}
