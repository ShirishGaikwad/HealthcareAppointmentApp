//
//  HealthcareAppointmentAppApp.swift
//  HealthcareAppointmentApp
//
//  Created by shirish gayakawad on 27/07/25.
//
//This is your app entry point
import SwiftUI
import SwiftData


@main
struct HealthcareAppointmentAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }
        }
    }
}
