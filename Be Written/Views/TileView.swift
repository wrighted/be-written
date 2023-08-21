//
//  TileView.swift
//  Be Written
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import SwiftUI
import MapKit

struct TileView: View {
    var coordinate: CLLocationCoordinate2D
    var data: String
    
    var body: some View {
        HStack {
            Text("Insert daily writing here")
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack{
                Text("Some kinda information")
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
