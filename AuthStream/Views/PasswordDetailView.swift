//
//  PasswordDetailView.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 07/01/26.
//

import SwiftUI
import SwiftData

struct PasswordDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    let item: PasswordItem
    @State private var showPassword = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.4))
            
            Text("Account Details")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 16) {
                
                detailRow(title: "Account Type", value: item.accountName)
                detailRow(title: "Username / Email", value: item.username)
                
                HStack {
                    Text(showPassword ? item.password : "********")
                    Spacer()
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                }
            }
            
            HStack(spacing: 16) {
                
                Button("Edit") {
                    // mutate item directly (SwiftData auto-saves)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.black)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                Button("Delete") {
                    context.delete(item)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.caption).foregroundColor(.gray)
            Text(value)
        }
    }
}

