//
//  Prospect.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//

import Foundation
import SwiftData

@Model
final class Prospect {

    var fullName: String
    var company: String
    var email: String
    var phone: String
    var createdAt: Date

    @Relationship(
        deleteRule: .cascade,
        inverse: \Note.prospect
    )
    var notes: [Note] = []

    init(
        fullName: String,
        company: String = "",
        email: String = "",
        phone: String = ""
    ) {

        self.fullName = fullName
        self.company = company
        self.email = email
        self.phone = phone
        self.createdAt = Date()
    }
}
