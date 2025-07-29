//
//  AppointmentViewModel.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import Foundation
class AppointmentViewModel: ObservableObject {
    @Published var selectedDate = Date()
    @Published var selectedSlot: String?

    let availableSlots = [
        "10:00 AM", "11:00 AM", "2:00 PM", "3:30 PM", "5:00 PM"
    ]
}
