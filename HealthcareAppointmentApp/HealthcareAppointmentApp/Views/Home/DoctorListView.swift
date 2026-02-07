//
//  DoctorListView.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//
//
//
import SwiftUI
// MARK: - 7. DoctorListView.swift
struct DoctorListView: View {
    @StateObject private var doctorListVM = DoctorListViewModel()

    var body: some View {
        List(doctorListVM.doctors) { doctor in
            NavigationLink(destination: DoctorDetailView(doctor: doctor)) {
                HStack(spacing: 12) {
                    Image(doctor.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .shadow(radius: 2)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(doctor.name)
                            .font(.headline)

                        Text(doctor.specialty)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Available Doctors")
    }
}

struct DoctorListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DoctorListView()
        }
    }
}
