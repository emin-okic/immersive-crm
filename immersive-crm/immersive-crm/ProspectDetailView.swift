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

    @State private var noteDraft = ""

    private var sortedNotes: [Note] {

        prospect.notes.sorted {
            $0.createdAt > $1.createdAt
        }
    }

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 32
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
                // NOTES SECTION
                //
                VStack(
                    alignment: .leading,
                    spacing: 20
                ) {

                    HStack {

                        Text("Activity Feed")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Spacer()

                        Text("\(prospect.notes.count) Notes")
                            .foregroundStyle(.secondary)
                    }

                    //
                    // COMPOSER
                    //
                    HStack(spacing: 12) {

                        TextField(
                            "Add a note...",
                            text: $noteDraft,
                            axis: .vertical
                        )
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1...4)

                        Button {

                            addNote()

                        } label: {

                            Image(systemName: "paperplane.fill")
                                .font(.headline)
                                .padding(10)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(
                            noteDraft
                                .trimmingCharacters(
                                    in: .whitespacesAndNewlines
                                )
                                .isEmpty
                        )
                    }

                    //
                    // NOTES THREAD
                    //
                    LazyVStack(
                        alignment: .leading,
                        spacing: 14
                    ) {

                        if sortedNotes.isEmpty {

                            ContentUnavailableView(
                                "No Notes Yet",
                                systemImage: "bubble.left"
                            )

                        } else {

                            ForEach(sortedNotes) { note in

                                NoteCardView(
                                    note: note,
                                    onDelete: {
                                        delete(note)
                                    }
                                )
                            }
                        }
                    }
                }

                Divider()

                //
                // FUTURE METRICS
                //
                VStack(
                    alignment: .leading,
                    spacing: 16
                ) {

                    Text("Activity Metrics")
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
                            title: "Notes",
                            value: "\(prospect.notes.count)",
                            icon: "note.text"
                        )
                    }
                }
            }
            .padding(40)
        }
        .onDisappear {

            try? modelContext.save()
        }
    }

    //
    // ADD NOTE
    //
    private func addNote() {

        let trimmed = noteDraft.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmed.isEmpty else {
            return
        }

        let note = Note(
            content: trimmed,
            prospect: prospect
        )

        prospect.notes.append(note)

        modelContext.insert(note)

        try? modelContext.save()

        noteDraft = ""
    }

    //
    // DELETE NOTE
    //
    private func delete(_ note: Note) {

        prospect.notes.removeAll {
            $0 == note
        }

        modelContext.delete(note)

        try? modelContext.save()
    }
}
