//
//  Note.swift
//  Be Written
//
//  Created by Ethan Wright on 2022-11-26.
//

import Foundation
import SwiftUI

class Note: Identifiable, ObservableObject {
    
    let id = UUID()
    var title: String
    var date: Date
    var content: String
    
    init() {
        self.date = Date()
        self.title = self.date.formatted()
        self.content = ""
    }
}

struct TileView: View {
    var data: String
    
    var body: some View {
        HStack {
            Text(data)
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            VStack{
                Text("HI")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Text("bye")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct CardView: View {
    var title: String
    var content: AnyView
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack{
                    Text(title)
                        .font(.title)
                        .padding()
                    Spacer()
                }
                content
                    .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
