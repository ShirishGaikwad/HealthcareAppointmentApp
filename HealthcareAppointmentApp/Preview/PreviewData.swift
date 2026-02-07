//
//  PreviewData.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//
//Optional: Add dummy data for SwiftUI previews
import SwiftUI
import Foundation
// MARK: - Sample Preview Data

struct PreviewData {
    static let sampleDoctors: [Doctor] = [
        Doctor(id: UUID(), name: "Dr. A Sharma", specialty: "Cardiologist", image: "doctor-1", bio: "Dr. Sharma is a highly skilled cardiologist with over 10 years of experience in diagnosing and treating cardiovascular diseases."),
        Doctor(id: UUID(), name: "Dr. B Patel", specialty: "Dermatologist", image: "doctor-2", bio: "Dr. Patel specializes in skin, hair, and nail conditions with 8 years of clinical experience."),
        Doctor(id: UUID(), name: "Dr. C Mehta", specialty: "Orthopedic", image: "doctor-3", bio: "Dr. Mehta is a senior orthopedic surgeon known for treating joint and bone disorders."),
        Doctor(id: UUID(), name: "Dr. D Nair", specialty: "Neurologist", image: "doctor-4", bio: "Dr. Nair focuses on disorders of the nervous system, including the brain and spinal cord."),
        Doctor(id: UUID(), name: "Dr. E Rao", specialty: "Pediatrician", image: "doctor-5", bio: "Dr. Rao cares for children's health from infancy to adolescence."),
        Doctor(id: UUID(), name: "Dr. F Khan", specialty: "Gynecologist", image: "doctor-6", bio: "Dr. Khan provides expert care in women's health, prenatal care, and reproductive health."),
        Doctor(id: UUID(), name: "Dr. G Singh", specialty: "Psychiatrist", image: "doctor-7", bio: "Dr. Singh offers mental health support and psychiatric evaluations."),
//        Doctor(id: UUID(), name: "Dr. H Desai", specialty: "Dentist", image: "doctor-8", bio: "Dr. Desai provides dental care including cosmetic and surgical procedures."),
//        Doctor(id: UUID(), name: "Dr. I Joshi", specialty: "Oncologist", image: "doctor-9", bio: "Dr. Joshi specializes in diagnosing and treating various forms of cancer."),
//        Doctor(id: UUID(), name: "Dr. J Thomas", specialty: "General Physician", image: "doctor-10", bio: "Dr. Thomas treats a wide range of health conditions and focuses on preventive care.")
    ]

    static let sampleDoctor = sampleDoctors[0]
}
