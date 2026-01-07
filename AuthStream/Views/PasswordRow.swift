//
//  PasswordRow.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 07/01/26.
//

import SwiftUI

struct PasswordRow: View {
    
    let item: PasswordItem
    
    var body: some View {
        HStack {
            Text(item.accountName)
                .font(.headline)
            
            Spacer()
            
            Text("******")
                .foregroundColor(.gray)
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}
