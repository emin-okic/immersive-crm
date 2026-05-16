//
//  AddProspectView.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//


import SwiftUI
import SwiftData

struct AddProspectView: View {

    @Environment(\.dismiss)
    private var dismiss

    @Environment(\.modelContext)
    private var modelContext

    @State private var fullName = ""
    @State private var company = ""
    @State private var email = ""
    @State private var phone = ""

    var body: some View {

        NavigationStack {

            Form {

                TextField(
                    "Full Name",
                    text: $fullName
                )

                TextField(
                    "Company",
                    text: $company
                )

                TextField(
                    "Email",
                    text: $email
                )

                TextField(
                    "Phone",
                    text: $phone
                )
            }
            .navigationTitle("New Prospect")
            .toolbar {

                ToolbarItem(
                    placement: .confirmationAction
                ) {

                    Button("Save") {

                        let prospect = Prospect(
                            fullName: fullName,
                            company: company,
                            email: email,
                            phone: phone
                        )

                        modelContext.insert(prospect)

                        try? modelContext.save()

                        dismiss()
                    }
                    .disabled(fullName.isEmpty)
                }

                ToolbarItem(
                    placement: .cancellationAction
                ) {

                    Button("Cancel") {

                        dismiss()
                    }
                }
            }
        }
        .frame(
            minWidth: 500,
            minHeight: 400
        )
    }
}
