//
//  DoctorListViewModel.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import Foundation
class DoctorListViewModel: ObservableObject {
    @Published var doctors: [Doctor] = PreviewData.sampleDoctors

}
