//
//  PasswordCheckerview.swift
//  PasswordCohort09
//
//  Created by Lenin Baku Cortez Hernandez on 24/06/26.
//

import SwiftUI

// Model = What is the data? What type?
//ViewModel = What should i do to the data before the user sees it
//View = Get me the data so i can show it to the user

struct PasswordCheckerview: View {
    
    @StateObject private var viewModel = PasswordViewModel()
    
    var body: some View {
        
        VStack (spacing:20){
            Text("Password checker")
                .font(.title)
                .bold()

            SecureField("Enter password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onChange(of:viewModel.password){
                    viewModel.checkPassword()
                }
            //"invalid"
            // PasswordStrength.invalid
            Text(viewModel.strenght.rawValue)
                .padding()
                .font(.headline)
            
        }
        
    }
}


#Preview {
    PasswordCheckerview()
}
