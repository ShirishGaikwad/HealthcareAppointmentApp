//
//  Doctor.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import Foundation
struct Doctor: Identifiable {
    let id: UUID
    let name: String
    let specialty: String
    let image: String
    let bio: String
}
