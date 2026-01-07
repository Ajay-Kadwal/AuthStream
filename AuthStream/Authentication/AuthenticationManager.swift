//
//  AuthenticationManager.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 21/12/25.
//

import Foundation
import FirebaseAuth


struct AuthDataResultModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let userData = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: userData.user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let userData = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: userData.user)
    }
    
    func authenticatedUser() throws -> AuthDataResultModel {
        guard let getAuthUser = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: getAuthUser)
    }
    
    func updatePassword(password: String) async throws {
        guard let authUser = Auth.auth().currentUser else {
            throw URLError(.fileIsDirectory)
        }
        try await authUser.updatePassword(to: password)
    }
    
    func updateEmial(email: String) async throws {
        guard let authUser = Auth.auth().currentUser else {
            throw URLError(.fileIsDirectory)
        }
        
        try await authUser.sendEmailVerification(beforeUpdatingEmail: email)
    }
    
    func resetPassword(email: String) async throws {
        try await  Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
}
