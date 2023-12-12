//
//  Note.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import MapKit

// encode/decode functionality manually implemeted to
// allow using DocumentID as internal ID
struct Note: Codable, Identifiable {
    
    @DocumentID var id: String? // filled by firebase
    var timestamp: Double
    var latitude: Double
    var longitude: Double
    var content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case timestamp = "timestamp"
        case latitude = "latitude"
        case longitude = "longitude"
        case content = "content"
    }
    
    init(id: String? = nil,
         timestamp: Double,
         latitude: Double,
         longitude: Double,
         content: String) {
        self.id = id
        self.timestamp = timestamp
        self.latitude = latitude
        self.longitude = longitude
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try container.decode(Double.self, forKey: .timestamp)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        content = try container.decode(String.self, forKey: .content)
        
        // Decode the DocumentID property using the Firestore decoder
        if let idContainer = try? decoder.container(keyedBy: CodingKeys.self),
           let id = try? idContainer.decode(String.self, forKey: .id) {
            self.id = id
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(content, forKey: .content)
        
        // Encode the DocumentID property using the Firestore encoder
        if let id = id {
            let firestoreEncoder = Firestore.Encoder()
            let something = try firestoreEncoder.encode(["id":id])
            
            if let mapId = something["id"] as? String {
                try container.encode(mapId, forKey: .id)
            }
        }
    }
}

