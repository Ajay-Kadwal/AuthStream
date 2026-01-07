//
//  AddPasswordView.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 07/01/26.
//

import SwiftUI
import SwiftData

struct AddPasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @StateObject var viewModel =  AuthProvider()
    @State private var account = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 16) {
            
            Capsule()
                .frame(width: 40, height: 3)
                .foregroundColor(.gray.opacity(0.4))
            
            TextField("Account Name", text: $account)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            
            TextField("Username / Email", text: $username)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            
            Button {
                if !account.isEmpty, !username.isEmpty, !password.isEmpty {
                    let newItem = PasswordItem(
                        accountName: account,
                        username: username,
                        password: password
                    )
                    context.insert(newItem)
                    // Firebase
                    Task {
                        do {
                            try await viewModel.SignInUser(email: username, password: password)
                        } catch {
                            
                        }
                    }
                
                    dismiss()
                } else {
                    return
                }
                
            } label: {
                Text("Add New Account")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .padding()
    }
}
