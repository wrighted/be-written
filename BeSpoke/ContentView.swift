//
//  ContentView.swift
//  bespoke
//
//  Created by Ethan Wright on 2022-10-30.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State var newDay = false
    
    var body: some View {
        let view = newDay
        ? AnyView(ScrollingView())
        : AnyView(NewEntryView())
        
        view
            .background(Color(red: 0.0, green: 0.1, blue: 0.0))
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
