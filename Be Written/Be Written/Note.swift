//
//  Note.swift
//  Be Written
//
//  Created by Ethan Wright on 2022-11-26.
//

import Foundation

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
