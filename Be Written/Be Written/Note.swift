//
//  Note.swift
//  Be Written
//
//  Created by Ethan Wright on 2022-11-26.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var mapImage: UIImage? = nil
        
    var body: some View {
        Image(uiImage: mapImage ?? UIImage())
            .resizable()
            .scaledToFit()
            .onAppear {
                generateMapImage()
            }
    }
    
    private func generateMapImage() {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        options.size = CGSize(width: 300, height: 300)
        options.mapType = .standard
        
        let snapshotter = MKMapSnapshotter(options: options)
        
        snapshotter.start { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                return
            }
            
            mapImage = snapshot.image
        }
    }
}

struct QuoteView: View {
    var title: String
    var quote: String
    
    var body: some View {
        CardView(title: title, content: AnyView(Text(quote)))
    }
}

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
            .background(.gray)
            .cornerRadius(20)
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
