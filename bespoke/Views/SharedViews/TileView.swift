//
//  TileView.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import SwiftUI
import MapKit

struct TileView: View {
    var coordinate: CLLocationCoordinate2D
    var content: String
    var altText: String = "Some kinda information"
    
    var body: some View {
        HStack {
            Text(self.content)
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack{
                Text(self.altText)
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                MapView(coordinate: coordinate)
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }
}
