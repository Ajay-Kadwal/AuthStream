//
//  AuthProvider.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 07/01/26.
//

import Foundation
import Combine

final class AuthProvider: ObservableObject {
    
    func SignInUser(email: String, password: String) async throws {
        let _ = try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
}
