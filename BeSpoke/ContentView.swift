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
    
    let tags: [Tag] = [
        Tag(
            id: 1,
            notes: [1, 2],
            title: "smiley",
            imagePath: "face.smiling"),
        Tag(
            id: 2,
            notes: [1, 3, 5],
            title: "sad",
            imagePath: "hand.thumbsdown"),
        Tag(
            id: 3,
            notes: [2, 3, 4],
            title: "rainy",
            imagePath: "cloud"),
        Tag(id: 4,
            notes: [4],
            title: "sunny",
            imagePath: "sun.min"),
        Tag(id: 5,
            notes: [5],
            title: "mid",
            imagePath: "stop.fill"),
        Tag(id: 6,
            notes: [],
            title: "best day",
            imagePath: "music.note")
    ]

    // Real code follows.
    var body: some View {
        NavigationView {
            ScrollView {
                QuoteView(quote: quote)
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(notes) { note in
                        // This is hopefully not necessary with database
                        // look-ups
                        let notesTags = tags.filter { $0.notes.contains(note.id) }
                        
                        NoteView(note: note, tags: notesTags)
                    }
                }
            }
            .navigationTitle("Bespoke")
            .background(Color(red: 0.0, green: 0.1, blue: 0.0))
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
