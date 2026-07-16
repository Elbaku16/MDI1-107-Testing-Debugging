//
//  HomeView.swift
//  LoginRegistrationApp
//
//  Created by Lenin Baku Cortez Hernandez on 15/07/26.
//

import SwiftUI

struct HomeView: View {
    let username: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)

            Text("Welcome, \(username)!")
                .font(.title.bold())
                .accessibilityIdentifier("welcomeText")
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView(username: "Student")
}
