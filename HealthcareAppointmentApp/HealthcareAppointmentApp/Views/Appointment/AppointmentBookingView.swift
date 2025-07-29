//
//  AppointmentBookingView.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//

import SwiftUI

struct AppointmentBookingView: View {
    let doctor: Doctor

    @ObservedObject var viewModel = AppointmentViewModel()
    @State private var showConfirmation = false
    @State private var navigateToHome = false  // ✅ Step 1

    var body: some View {
        VStack(spacing: 20) {
            Text("Book Appointment with")
                .font(.headline)

            Text(doctor.name)
                .font(.title2)
                .bold()

            // 📅 Date Picker
            VStack(alignment: .leading) {
                Text("Select Date")
                    .font(.subheadline)

                DatePicker("",
                           selection: $viewModel.selectedDate,
                           in: Date()...,
                           displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            // 🕒 Time Slots
            VStack(alignment: .leading) {
                Text("Select Time Slot")
                    .font(.subheadline)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 12) {
                    ForEach(viewModel.availableSlots, id: \.self) { slot in
                        Text(slot)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(viewModel.selectedSlot == slot ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(viewModel.selectedSlot == slot ? .white : .primary)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedSlot = slot
                                }
                            }
                    }
                }
            }
            .padding()

            Spacer()

            // ✅ Confirm Button
            Button(action: {
                showConfirmation = true
            }) {
                Text("Confirm Appointment")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.selectedSlot != nil ? Color.green : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(viewModel.selectedSlot == nil)
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Appointment Confirmed"),
                    message: Text("Your appointment with Dr. \(doctor.name) on \(formattedDate()) at \(viewModel.selectedSlot ?? "") has been confirmed."),
                    dismissButton: .default(Text("OK")) {
                        navigateToHome = true  // ✅ Step 2
                    }
                )
            }

            // ✅ Step 3: Hidden NavigationLink to Home (DoctorListView)
            NavigationLink(destination: DoctorListView(), isActive: $navigateToHome) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Book Appointment")
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: viewModel.selectedDate)
    }
}

struct AppointmentBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppointmentBookingView(doctor: PreviewData.sampleDoctor)
        }
    }
}
