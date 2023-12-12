//
// NewEntryView.swift
// bespoke
//
// Created by Ethan Wright on 2023-12-11
//
        

import Foundation
import FirebaseCore
import FirebaseFirestore
import SwiftUI

struct NewEntryView: View {
    @State private var title = ""
    @State private var content = ""
    @State private var submitted = false

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()

            TextField("Journal Entry", text: $content)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()

            NavigationLink(destination: ScrollingView(), isActive: $submitted) {
                EmptyView()
            }
            .hidden()
            
            Button("Submit") {
                do {
                    let db = Firestore.firestore()
                    
                    // TODO: get current date and location
                    let note = Note(
                        timestamp: Date().timeIntervalSince1970,
                        latitude: 37.7749,
                        longitude: -122.4194,
                        content: content)
                    
                    try db.collection("notes").addDocument(from: note)
                    submitted = true
                }
                catch {
                     print("Error with encoding to firebase")
                }
            }
            .padding()
        }
        .padding()
    }
}
