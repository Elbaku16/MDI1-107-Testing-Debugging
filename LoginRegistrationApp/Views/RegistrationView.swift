//
//  RegistrationView.swift
//  LoginRegistrationApp
//
//  Created by Lenin Baku Cortez Hernandez on 15/07/26.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: AuthViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle.bold())

            TextField("Username", text: $viewModel.regUsername)
                .textFieldStyle(.roundedBorder)
                .accessibilityIdentifier("registerUsernameField")

            TextField("Email", text: $viewModel.regEmail)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .accessibilityIdentifier("registerEmailField")

            SecureField("Password", text: $viewModel.regPassword)
                .textFieldStyle(.roundedBorder)
                .accessibilityIdentifier("registerPasswordField")

            SecureField("Confirm Password", text: $viewModel.regConfirmPassword)
                .textFieldStyle(.roundedBorder)
                .accessibilityIdentifier("registerConfirmPasswordField")

            if !viewModel.registerErrorMessage.isEmpty {
                Text(viewModel.registerErrorMessage)
                    .foregroundColor(.red)
                    .accessibilityIdentifier("registerErrorText")
            }

            Button("Register") {
                viewModel.register()
                if viewModel.didRegister {
                    dismiss()
                }
            }
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("registerButton")
        }
        .padding()
        .navigationTitle("Register")
    }
}

#Preview {
    RegistrationView(viewModel: AuthViewModel())
}
