//
//  Note.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/17/26.
//

import Foundation
import SwiftData

@Model
final class Note {

    var content: String
    var createdAt: Date

    @Relationship
    var prospect: Prospect?

    init(
        content: String,
        createdAt: Date = Date(),
        prospect: Prospect? = nil
    ) {

        self.content = content
        self.createdAt = createdAt
        self.prospect = prospect
    }
}
