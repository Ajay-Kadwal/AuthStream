//
//  PasswordItem.swift
//  AuthStream
//
//  Created by AJAY KADWAL on 07/01/26.
//

import Foundation
import SwiftData

@Model
final class PasswordItem {
    
    @Attribute(.unique)
    var id: UUID
    
    var accountName: String
    var username: String
    var password: String   // encrypted later
    
    init(
        id: UUID = UUID(),
        accountName: String,
        username: String,
        password: String
    ) {
        self.id = id
        self.accountName = accountName
        self.username = username
        self.password = password
    }
}
