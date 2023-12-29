//
//  ContentView.swift
//  bespoke
//
//  Created by Ethan Wright on 2022-10-30.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        if authManager.authState != .signedOut {
            ScrollingView()
        } else {
            LoginView()
        }
    }
}
