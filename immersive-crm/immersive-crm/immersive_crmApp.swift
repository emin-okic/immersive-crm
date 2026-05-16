//
//  immersive_crmApp.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//

import SwiftUI
import SwiftData

@main
struct immersive_crmApp: App {

    var body: some Scene {

        WindowGroup {

            ContentView()
        }
        .modelContainer(for: [
            Prospect.self
        ])
    }
}
