//
//  LoginView.swift
//  LoginRegistrationApp
//
//  Created by Lenin Baku Cortez Hernandez on 15/07/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle.bold())

                TextField("Email", text: $viewModel.loginEmail)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .accessibilityIdentifier("loginEmailField")

                SecureField("Password", text: $viewModel.loginPassword)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("loginPasswordField")

                if !viewModel.loginErrorMessage.isEmpty {
                    Text(viewModel.loginErrorMessage)
                        .foregroundColor(.red)
                        .accessibilityIdentifier("loginErrorText")
                }

                Button("Login") {
                    viewModel.login()
                }
                .buttonStyle(.borderedProminent)
                .accessibilityIdentifier("loginButton")

                NavigationLink("Create an account") {
                    RegistrationView(viewModel: viewModel)
                }
                .accessibilityIdentifier("goToRegisterButton")
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                HomeView(username: viewModel.loggedInUsername)
            }
        }
    }
}

#Preview {
    LoginView()
}
