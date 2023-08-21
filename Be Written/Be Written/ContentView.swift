//
//  ContentView.swift
//  Be Written
//
//  Created by Ethan Wright on 2022-10-30.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // This is fake data. If you couldn't tell.
    let tileData = ["Today", "Yesterday", "The day before", "The day before that", "... you guess it."]
    let quote = "Insert Knowledge here, perhaps why there's still white backgrounds."
    let locationCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    
    // Real code follows.
    var body: some View {
        NavigationView {
            ScrollView {
                QuoteView(title: "Quote of the day", quote: quote)
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(tileData, id: \.self) { data in
                        CardView(title: data, content: AnyView(TileView(coordinate: locationCoordinate, data: data)))
                    }
                }
            }
            .navigationTitle("BeSpoke")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
