//
//  HomeView.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 06/01/26.
//

import SwiftUI
import Foundation
import Combine
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var passwords: [PasswordItem]
    
    @State private var showAddSheet = false
    @State private var selectedItem: PasswordItem?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 14) {
                    ForEach(passwords) { item in
                        Button {
                            selectedItem = item
                        } label: {
                            PasswordRow(item: item)
                        }
                    }
                }
                .padding()
            }
            
            Button {
                showAddSheet = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 56, height: 56)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(radius: 5)
            }
            .padding()
        }
        .navigationTitle("Password Manager")
        
        .sheet(isPresented: $showAddSheet) {
            AddPasswordView()
                .presentationDetents([.medium])
        }
        
        .sheet(item: $selectedItem) { item in
            PasswordDetailView(item: item)
                .presentationDetents([.medium])
        }
    }
}
#Preview {
    NavigationStack {
        HomeView()
    }
}
