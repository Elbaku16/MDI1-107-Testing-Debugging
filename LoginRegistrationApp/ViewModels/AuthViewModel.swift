//
//  AuthViewModel.swift
//  LoginRegistrationApp
//
//  Created by Lenin Baku Cortez Hernandez on 15/07/26.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {

    
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    @Published var loginErrorMessage: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var loggedInUsername: String = ""

    
    @Published var regUsername: String = ""
    @Published var regEmail: String = ""
    @Published var regPassword: String = ""
    @Published var regConfirmPassword: String = ""
    @Published var registerErrorMessage: String = ""
    @Published var didRegister: Bool = false

    
    private var users: [User] = [
        User(username: "Student", email: "student@test.com", password: "test123")
    ]

    // MARK: validation of the log in

    func isValidEmail(_ email: String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        guard password.count >= 6 else { return false }
        return password.contains(where: { $0.isNumber })
    }

    // mark login

    func login() {
        loginErrorMessage = ""

        guard !loginEmail.isEmpty, !loginPassword.isEmpty else {
            loginErrorMessage = "Email and password cannot be empty"
            return
        }

        guard isValidEmail(loginEmail) else {
            loginErrorMessage = "Please enter a valid email"
            return
        }

        if let user = users.first(where: { $0.email == loginEmail && $0.password == loginPassword }) {
            loggedInUsername = user.username
            isLoggedIn = true
        } else {
            loginErrorMessage = "Incorrect email or password"
        }
    }

    // MARK: - Register of user

    func register() {
        registerErrorMessage = ""

        guard !regUsername.isEmpty else {
            registerErrorMessage = "Username cannot be empty"
            return
        }

        guard isValidEmail(regEmail) else {
            registerErrorMessage = "Please enter a valid email"
            return
        }

        guard isValidPassword(regPassword) else {
            registerErrorMessage = "Password must be at least 6 characters and contain a number"
            return
        }

        guard regPassword == regConfirmPassword else {
            registerErrorMessage = "Passwords do not match"
            return
        }

        let newUser = User(username: regUsername, email: regEmail, password: regPassword)
        users.append(newUser)
        didRegister = true
    }
}
