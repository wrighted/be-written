//
//  MapView.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    @State private var mapImage: UIImage?

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
        options.region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
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
