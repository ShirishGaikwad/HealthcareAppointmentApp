//
//  LoginView.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Login") {
                    validateAndLogin()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                NavigationLink("Don't have an account? Sign Up", destination: SignupView(authVM: authVM))
                
                // Hidden NavigationLink
                NavigationLink(destination: DoctorListView(), isActive: $navigateToHome) {
                    EmptyView()
                }
            }
            .padding()
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Login Failed"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // MARK: - Login Helpers
    
    private func validateAndLogin() {
        // 1️⃣ Local Validation
        guard !email.isEmpty else {
            handleLoginFailure(message: "Email is required.")
            return
        }
        
        guard isValidEmail(email) else {
            handleLoginFailure(message: "Invalid email format.")
            return
        }
        
        guard !password.isEmpty else {
            handleLoginFailure(message: "Password is required.")
            return
        }
        guard password.count >= 6 else {
            handleLoginFailure(message: "Password must be at least 6 characters long.")
            return
        }
        // 2️⃣ Attempt Dummy Login
        authVM.login(email: email, password: password)
        if authVM.isAuthenticated {
            handleLoginSuccess()
        } else {
            handleLoginFailure(message: "Invalid email or password.")
        }
    }
    
    private func handleLoginSuccess() {
        navigateToHome = true
    }
    
    private func handleLoginFailure(message: String) {
        errorMessage = message
        showErrorAlert = true
    }
    
    // ✅ Email format validation (same as SignupView)
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
