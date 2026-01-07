
⸻

📱 Overview

AuthStream enables users to authenticate securely using Firebase and manage their personal account credentials locally.
The app leverages SwiftUI’s declarative UI and SwiftData’s native persistence to deliver a smooth and reactive user experience.

⸻

✨ Key Features

🔑 Authentication (Firebase)
	•	Email & password Sign Up / Sign In
	•	Secure session handling via Firebase Authentication
	•	Authentication state management
	•	Password reset support

🗂 Password Management
	•	Add new account credentials (account name, username/email, password)
	•	View saved passwords in a clean card-based layout
	•	Masked password display with controlled visibility
	•	delete existing credentials
	•	Bottom-sheet based detail and add flows

💾 Local Persistence (SwiftData)
	•	Persistent storage using SwiftData (@Model)
	•	Automatic UI updates with @Query
	•	No manual state synchronization required
	•	Data-driven sheet navigation using .sheet(item:)

🎨 User Experience
	•	Native SwiftUI design
	•	Floating action button for adding new accounts
	•	Bottom sheets following iOS Human Interface Guidelines
	•	Clean, minimal, and scalable UI architecture

⸻

🛠 Tech Stack
	•	Language: Swift
	•	UI Framework: SwiftUI
	•	Authentication: Firebase Authentication
	•	Persistence: SwiftData
	•	Architecture: MVVM-lite / Data-Driven UI
	•	Platform: iOS 17+

⸻

🧱 Architecture Highlights
	•	Centralized authentication handling with Firebase
	•	SwiftData models using @Model for type-safe persistence
	•	@Query for reactive UI updates
	•	Data-driven .sheet(item:) navigation to prevent state race conditions
	•	Clear separation between authentication, persistence, and UI layers

⸻

🔒 Security Considerations
	•	User authentication handled securely by Firebase (passwords never stored locally)
	•	Local password data stored using SwiftData (encryption planned)
	•	Masked password visibility
	•	Firebase configuration files excluded from version control

AuthStream
│
├── Authentication
│   ├── AuthenticationManager.swift
│   ├── SignInViewModel.swift
│
├── Models
│   └── PasswordItem.swift   // SwiftData @Model
│
├── Views
│   ├── HomeView.swift
│   ├── AddPasswordView.swift
│   ├── PasswordDetailView.swift
│   └── PasswordRow.swift
│
├── Resources
│
└── AuthStreamApp.swift



<img width="345" height="710" alt="Screenshot 2026-01-07 at 3 07 44 PM" src="https://github.com/user-attachments/assets/9c05171f-c1a1-4ff7-813c-86a19310ad57" />
<img width="353" height="705" alt="Screenshot 2026-01-07 at 3 07 57 PM" src="https://github.com/user-attachments/assets/504ca133-3359-4e3c-929a-6d9321422bbf" />
<img width="375" height="713" alt="Screenshot 2026-01-07 at 3 08 34 PM" src="https://github.com/user-attachments/assets/34cc3440-4a42-417a-b5fc-d4e183629b5d" />
<img width="1440" height="784" alt="Screenshot 2026-01-07 at 4 35 49 PM" src="https://github.com/user-attachments/assets/cfd4243f-a0c9-4fef-9653-947f0f1efb3f" />

