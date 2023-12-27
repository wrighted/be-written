//
// ScrollingView.swift
// bespoke
//
// Created by Ethan Wright on 2023-12-11
//

import FirebaseFirestore
import Foundation
import SwiftUI

struct ScrollingView: View {
    // This is fake data. If you couldn't tell.
    let quote = Quote(
        title: "Quote of the day",
        quote: "Insert Knowledge here, perhaps why there's still white backgrounds.")

    let tags: [Tag] = [
        Tag(
            notes: [1, 2],
            title: "smiley",
            imagePath: "face.smiling"),
        Tag(
            notes: [1, 3, 5],
            title: "sad",
            imagePath: "hand.thumbsdown"),
        Tag(
            notes: [2, 3, 4],
            title: "rainy",
            imagePath: "cloud"),
        Tag(
            notes: [4],
            title: "sunny",
            imagePath: "sun.min"),
        Tag(
            notes: [5],
            title: "mid",
            imagePath: "stop.fill"),
        Tag(notes: [],
            title: "best day",
            imagePath: "music.note")
    ]

    // Real code follows.

    @State private var activeUser: User = getActiveUser()
    @State private var notes: [Note] = []

    var body: some View {
        NavigationView {
            ScrollView {
                QuoteView(quote: quote)
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(notes) { note in
                        // TODO: tag matching
                        NoteView(note: note, tags: tags)
                    }
                }
                .onAppear(perform: fetchDocs)
            }
            .navigationTitle("Bespoke")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileView(user: $activeUser)) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NewEntryView()) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                }
            }
            .background(Color(red: 0.0, green: 0.1, blue: 0.0))
            .preferredColorScheme(.dark)
        }
    }

    // This should probably be moved to a Controller / DB layer
    func fetchDocs() {
        let db = Firestore.firestore()

        db.collection("notes").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting firebase documents: \(error)")

            } else {
                notes = querySnapshot?.documents.compactMap { document in
                    let data = document.data()

                    do {
                        var note = try Firestore.Decoder().decode(Note.self, from: data)
                        note.id = document.documentID

                        return note

                    } catch {
                        print("Error decoding firebase document: \(error)")
                        return nil
                    }
                } ?? []

                notes.sort { $0.timestamp > $1.timestamp }
            }
        }
    }
}
