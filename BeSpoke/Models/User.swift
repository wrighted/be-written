//
//  User.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-24.
//

import Foundation

struct User: Codable {
    var id: Int64
    var firstName: String
    var lastName: String
    var email: String
    var profileImage: URL
    var username: String
    var lastLogin: Double
    var accountCreated: Double
}
