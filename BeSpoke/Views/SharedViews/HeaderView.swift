//
//  DateView.swift
//  bespoke
//
//  Created by Ethan Wright on 2023-09-16.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    var header: String
    var tags: [Tag]
    
    var body: some View {
        VStack {
            HStack {
                Text(header)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Spacer()
                ForEach(tags, id: \.self.id) { tag in
                    TagView(tag: tag)
                }
            }.padding()
        }
    }
}
