# HealthcareAppointmentApp
**Healthcare Appointment SwiftUI App**:

---

```markdown
# 🏥 Healthcare Appointment iOS App

This is a sample iOS application built using **SwiftUI** and **MVVM architecture** that allows users to:
- Sign up and log in
- View a list of doctors
- Explore doctor details and reviews
- Book appointments with available time slots

---

## 📱 Features

- ✅ User Authentication (Login/Signup with local validation)
- 🧑‍⚕️ List of doctors with specialties and profiles
- 📄 Doctor profile with bio and patient reviews
- 📆 Appointment booking with date & time selection
- ✅ Appointment confirmation and navigation back to home
- 🧪 Includes sample data for testing and preview
- 💡 Clean, modular code using SwiftUI + MVVM

---

## 🛠 Tech Stack

| Layer       | Technology         |
|-------------|--------------------|
| UI          | Swift + SwiftUI            |
| Architecture| MVVM               |
| Data Binding| @State, @ObservedObject, @Published |
| Storage     | In-Memory (PreviewData for sample doctors) |

---

## 📂 Folder Structure

```

📁 HealthcareAppointmentApp
├── 📄 App Entry (main.swift)
├── 📄 Models
│   ├── Doctor.swift
│   ├── Appointment.swift
│   ├── User.swift
├── 📄 ViewModels
│   ├── DoctorListViewModel.swift
│   ├── DoctorDetailViewModel.swift
│   ├── AppointmentViewModel.swift
│   ├── AuthViewModel.swift
├── 📄 Views
│   ├── LoginView\.swift
│   ├── SignupView\.swift
│   ├── DoctorListView\.swift
│   ├── DoctorDetailView\.swift
│   ├── AppointmentBookingView\.swift
├── 📄 PreviewData.swift
└── 📄 Assets.xcassets (Add doctor images if needed)

````

---

## 🚀 Getting Started

### Prerequisites

- Xcode 14+ with SwiftUI support
- iOS 15.0+

### Setup

1. Clone the repo
   ```bash
   git clone https://github.com/ShirishGaikwad/HealthcareAppointmentApp
````

2. Open in Xcode
3. Build and run on Simulator or Device

---

## 🧪 Dummy Login Credentials

* Email: `test@test.com`
* Password: `123456`

Or use the **Sign Up** form to register.

---

## 📸 Screenshots

> Add screenshots of:
>
> * LoginView
> * SignupView
> * DoctorListView
> * DoctorDetailView
> * AppointmentBookingView

---

## ✨ Future Improvements

* Persist user sessions
* Connect to real backend / API
* Use Core Data or Firebase for storage
* Support editing/deleting appointments

---

## 📄 License

This project is licensed under the MIT License.

