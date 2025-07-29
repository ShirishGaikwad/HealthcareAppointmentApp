//
//  DoctorDetailViewModel.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import Foundation
import Combine

class DoctorDetailViewModel: ObservableObject {
    @Published var doctor: Doctor

    // Example: Future API response data (e.g. reviews or ratings)
    @Published var reviews: [String] = []
    @Published var rating: Double = 4.5

    init(doctor: Doctor) {
        self.doctor = doctor
        fetchReviews()
    }

    private func fetchReviews() {
        // Simulated API delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.reviews = [
                "Very professional and friendly.",
                "Helped me understand everything clearly.",
                "Excellent service and follow-up."
            ]
        }
    }
}
