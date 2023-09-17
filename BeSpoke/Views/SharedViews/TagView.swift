//
//  TagView.swift
//  bespoke
//
//  Created by Ethan Wright on 2023-09-16.
//

import Foundation
import SwiftUI

struct TagView: View {
    var tag: Tag
    
    var body: some View {
        HStack {
            Image(systemName: self.tag.imagePath)
            Text(self.tag.title)
                .lineLimit(1)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(20)
    }
}
