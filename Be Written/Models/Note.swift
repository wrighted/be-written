//
//  Note.swift
//  Be Written
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import MapKit

struct Note: Codable, Identifiable {
    var id: Int64?
    var timestamp: MTLTimestamp
    var latitude: Double
    var longitude: Double
    var content: String
}
