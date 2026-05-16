//
//  ProspectDetailView.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//

import SwiftUI
import SwiftData

struct ProspectDetailView: View {

    @Environment(\.modelContext)
    private var modelContext

    @Bindable var prospect: Prospect

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 28
            ) {

                //
                // HEADER
                //
                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {

                    Text("Prospect Details")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Manage contact information")
                        .foregroundStyle(.secondary)
                }

                Divider()

                //
                // CONTACT INFO
                //
                VStack(
                    alignment: .leading,
                    spacing: 20
                ) {

                    TextField(
                        "Full Name",
                        text: $prospect.fullName
                    )
                    .textFieldStyle(.roundedBorder)

                    TextField(
                        "Company",
                        text: $prospect.company
                    )
                    .textFieldStyle(.roundedBorder)

                    TextField(
                        "Email",
                        text: $prospect.email
                    )
                    .textFieldStyle(.roundedBorder)

                    TextField(
                        "Phone",
                        text: $prospect.phone
                    )
                    .textFieldStyle(.roundedBorder)
                }

                Divider()

                //
                // NOTES
                //
                VStack(
                    alignment: .leading,
                    spacing: 12
                ) {

                    Text("Notes")
                        .font(.headline)

                    TextEditor(
                        text: $prospect.notes
                    )
                    .frame(height: 220)
                    .padding(12)
                    .background(.gray.opacity(0.1))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16
                        )
                    )
                }

                Divider()

                //
                // FUTURE ACTIVITY SECTION
                //
                VStack(
                    alignment: .leading,
                    spacing: 16
                ) {

                    Text("Activity")
                        .font(.headline)

                    HStack(spacing: 20) {

                        ActivityCard(
                            title: "Calls",
                            value: "0",
                            icon: "phone.fill"
                        )

                        ActivityCard(
                            title: "Emails",
                            value: "0",
                            icon: "envelope.fill"
                        )

                        ActivityCard(
                            title: "Meetings",
                            value: "0",
                            icon: "calendar"
                        )
                    }
                }

                Spacer()
            }
            .padding(40)
        }
        .onDisappear {

            try? modelContext.save()
        }
    }
}
