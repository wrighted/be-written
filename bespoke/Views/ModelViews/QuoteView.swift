//
//  QuoteView.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import SwiftUI

struct QuoteView: View {
    var quote: Quote
    
    var body: some View {
        CardView(title: quote.title, content: AnyView(Text(quote.quote)))
    }
}
