//
//  AuthViewModel.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import Foundation
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false

    func login(email: String, password: String) {
        // Dummy validation
        isAuthenticated = (email == "test@test.com" && password == "123456")
    }

    func signup(email: String, password: String) {
        // Dummy signup
        isAuthenticated = true
    }
}
