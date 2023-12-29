//
//  TileView.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import MapKit
import SwiftUI

struct TileView: View {
    var coordinate: CLLocationCoordinate2D
    var content: String
    var altText: String = "Some kinda information" // TODO: remove?

    var body: some View {
        HStack {
            Text(self.content)
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

            Spacer()

            VStack {
                Text(self.altText)
                    .font(.headline)

                MapView(coordinate: coordinate)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
