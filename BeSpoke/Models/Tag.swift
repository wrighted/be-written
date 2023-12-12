//
//  Tag.swift
//  bespoke
//
//  Created by Ethan Wright on 2023-09-16.
//

import Foundation

struct Tag: Codable, Identifiable {
    var id: String?
    var notes: [Int64?]
    var title: String
    var imagePath: String
}
