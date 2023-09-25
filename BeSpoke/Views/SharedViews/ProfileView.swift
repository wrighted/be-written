//
// ProfileView.swift
// bespoke
//
// Created by Jared Webber on 2023-09-25
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    private var email = ""

    var body: some View {
        Form {
            Section(header: Text("Profile Information")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                Text(email) // email cant be modified due to oauth
                TextField("Last Name", text: $username)
                
            }
        }
        .navigationBarTitle("Profile")
        .navigationBarItems(trailing:
            Button(action: {
                // Save or update the profile information here
                // You can access firstName, lastName, and email here
            }) {
                Text("Save")
            }
        )
    }
}
