//
// NewEntryView.swift
// bespoke
//
// Created by Ethan Wright on 2023-12-11
//

import FirebaseCore
import FirebaseFirestore
import Foundation
import SwiftUI

struct NewEntryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var title = ""
    @State private var content = ""

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()

            TextField("Journal Entry", text: $content)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()

            Button("Submit") {
                do {
                    let db = Firestore.firestore()

                    // TODO: get current location
                    let note = Note(
                        latitude: 37.7749,
                        longitude: -122.4194,
                        content: content)

                    try db.collection("notes").addDocument(from: note)
                    presentationMode.wrappedValue.dismiss()
                }
                catch {
                    print("Error with encoding to firebase")
                }
            }
            .padding()
        }
        .padding()
        .background(Color(red: 0.0, green: 0.1, blue: 0.0))
        .preferredColorScheme(.dark)
    }
}
