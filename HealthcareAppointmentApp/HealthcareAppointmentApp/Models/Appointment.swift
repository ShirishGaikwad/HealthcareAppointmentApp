//
//  Appointment.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import Foundation
struct Appointment: Identifiable {
    let id = UUID()
    let doctor: Doctor
    let date: Date
    let slot: String
}
