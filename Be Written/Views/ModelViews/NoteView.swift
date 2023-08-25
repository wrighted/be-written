//
//  NoteView.swift
//  Be Written
//
//  Created by Jared Webber on 2023-08-21.
//

import Foundation
import SwiftUI
import MapKit

let dateFormatter = DateFormatter()


struct NoteView: View {
    private static let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.locale = Locale(identifier: "en_US")
            df.dateStyle = .medium
            df.timeStyle = .none
            return df
    }()
    var note: Note
    
    func getFormattedDateString() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self.note.timestamp))
        if Calendar.current.isDateInToday(date){
            return "Today"
        }
        if Calendar.current.isDateInYesterday(date){
            return "Yesterday"
        }
        return NoteView.dateFormatter.string(from: date)
    }
    
    var body: some View {
        CardView(title: self.getFormattedDateString(), content: AnyView(TileView(coordinate: CLLocationCoordinate2D(latitude: note.latitude, longitude: note.longitude), content: note.content)))
    }
}
