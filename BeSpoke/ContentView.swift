//
//  ContentView.swift
//  bespoke
//
//  Created by Ethan Wright on 2022-10-30.
//

import MapKit
import SwiftUI

struct ContentView: View {
    // This is fake data. If you couldn't tell.
    let quote = Quote(
        title: "Quote of the day",
        quote: "Insert Knowledge here, perhaps why there's still white backgrounds.")
    let notes: [Note] = [
        Note(
            id: 2,
            timestamp: Date().timeIntervalSince1970,
            latitude: 37.7749,
            longitude: -122.4194,
            content: "I think I'm the smartest person alive"),
        Note(
            id: 1,
            timestamp: Date().timeIntervalSince1970 - 86400,
            latitude: 37.7749,
            longitude: -122.4194,
            content: "It's So Over"),
        Note(
            id: 3,
            timestamp: Date().timeIntervalSince1970 - (2 * 86400),
            latitude: 37.7749,
            longitude: -122.4194,
            content: "We're So Back"),
        Note(
            id: 4,
            timestamp: Date().timeIntervalSince1970 - (3 * 86400),
            latitude: 37.7749,
            longitude: 22.4194,
            content: "I've already run out of content ideas"),
        Note(
            id: 5,
            timestamp: Date().timeIntervalSince1970 - (4 * 86400),
            latitude: 37.7749,
            longitude: -12.4194,
            content:
            """
            This comment is super long to demonstrate what happens if someone decided to write \
            an essay in the textbox, wouldnt that be crazy why would they do something like that \
            like why would anyone want to write more than a few words at a time, couldnt be me, \
            also we never decided on formatting rules or a character limit, that \
            should probably happen at some point eventually maybe if we ever work on this more
            """)
    ]

    // Real code follows.
    var body: some View {
        NavigationView {
            ScrollView {
                QuoteView(quote: quote)
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(notes) { note in
                        NoteView(note: note)
                    }
                }
            }.navigationTitle("BeSpoke")
            // Currently ^ this title apears twice at the top of the screen when you scroll down
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
