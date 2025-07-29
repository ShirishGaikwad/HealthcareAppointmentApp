//
//  DoctorDetailView.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import SwiftUI
// MARK: - 8. DoctorDetailView.swift

struct DoctorDetailView: View {
    @StateObject private var viewModel: DoctorDetailViewModel

    init(doctor: Doctor) {
        _viewModel = StateObject(wrappedValue: DoctorDetailViewModel(doctor: doctor))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.doctor.name)
                    .font(.largeTitle)
                    .bold()

                Text(viewModel.doctor.specialty)
                    .font(.title3)
                    .foregroundColor(.secondary)

                Text("About the Doctor")
                    .font(.headline)

                Text(viewModel.doctor.bio)
                    .font(.body)

                if !viewModel.reviews.isEmpty {
                    Text("Patient Reviews")
                        .font(.headline)

                    ForEach(viewModel.reviews, id: \.self) { review in
                        Text("• \(review)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                NavigationLink(destination: AppointmentBookingView(doctor: viewModel.doctor)) {
                    Text("Book Appointment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Doctor Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DoctorDetailView(doctor: PreviewData.sampleDoctor)
        }
    }
}
