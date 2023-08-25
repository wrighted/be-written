//
//  NoteView.swift
//  bespoke
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import MapKit
import SwiftUI

let dateFormatter = DateFormatter()

struct NoteView: View {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()

    var note: Note

    var body: some View {
        CardView(
            title: self.getFormattedDateString(),
            content: AnyView(
                TileView(
                    coordinate: CLLocationCoordinate2D(latitude: self.note.latitude, longitude: self.note.longitude),
                    content: self.note.content
                )
            )
        )
    }

    private func getFormattedDateString() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self.note.timestamp))
        if Calendar.current.isDateInToday(date) {
            return "Today"
        }
        if Calendar.current.isDateInYesterday(date) {
            return "Yesterday"
        }
        return NoteView.dateFormatter.string(from: date)
    }
}
