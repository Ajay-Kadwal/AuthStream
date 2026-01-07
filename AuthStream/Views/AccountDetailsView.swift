//
//  AccountDetailsView.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 07/01/26.
//

import SwiftUI

struct AccountDetailsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let accountName: String
    let username: String
    let password: String
    
    @State private var showPassword = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Drag Indicator
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.4))
                .padding(.top, 8)
            
            // Title
            Text("Account Details")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Details Section
            VStack(alignment: .leading, spacing: 16) {
                
                detailRow(title: "Account Type", value: accountName)
                
                detailRow(title: "Username / Email", value: username)
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Password")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(showPassword ? password : "********")
                            .font(.body)
                    }
                    
                    Spacer()
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical)
            
            // Action Buttons
            HStack(spacing: 16) {
                
                Button {
                    // Handle Edit Action
                } label: {
                    Text("Edit")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                
                Button {
                    // Handle Delete Action
                    dismiss()
                } label: {
                    Text("Delete")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            
            Spacer()
        }
        .padding()
        .presentationDetents([.medium])
    }
    
    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.body)
        }
    }
}
