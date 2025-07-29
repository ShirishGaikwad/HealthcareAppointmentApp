//
//  SignupView.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import SwiftUI
// MARK: - SignupView.swift


struct SignupView: View {
    @ObservedObject var authVM: AuthViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @State private var showErrorAlert = false
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Sign Up") {
                validateAndSignup()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Hidden NavigationLink
            NavigationLink(destination: DoctorListView(), isActive: $navigateToHome) {
                EmptyView()
            }
        }
        .padding()
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Signup Failed"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }

    // MARK: - Signup Validation Logic

    private func validateAndSignup() {
        // 1️⃣ Local Validation
        guard !email.isEmpty else {
            handleSignupFailure(message: "Email is required.")
            return
        }

        guard isValidEmail(email) else {
            handleSignupFailure(message: "Invalid email format.")
            return
        }

        guard !password.isEmpty else {
            handleSignupFailure(message: "Password is required.")
            return
        }

        guard password.count >= 6 else {
            handleSignupFailure(message: "Password must be at least 6 characters long.")
            return
        }

        // 2️⃣ Dummy Signup
        authVM.signup(email: email, password: password)

        if authVM.isAuthenticated {
            handleSignupSuccess()
        } else {
            handleSignupFailure(message: "Signup failed. Please try again.")
        }
    }

    private func handleSignupSuccess() {
        navigateToHome = true
    }

    private func handleSignupFailure(message: String) {
        errorMessage = message
        showErrorAlert = true
    }

    // MARK: - Email Format Validator
    private func isValidEmail(_ email: String) -> Bool {
        // Simple regex for demonstration
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
