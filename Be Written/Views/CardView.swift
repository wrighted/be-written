//
//  CardView.swift
//  Be Written
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import SwiftUI

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
