//
//  ContentView.swift
//  Be Written
//
//  Created by Ethan Wright on 2022-10-30.
//

import SwiftUI

struct ContentView: View {
    let tileData = ["Today", "Yesterday", "The day before", "The day before that", "... you guess it."]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(tileData, id: \.self) { data in
                        CardView(title: data, content: AnyView(TileView(data: data)))
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
