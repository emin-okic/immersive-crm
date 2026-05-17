//
//  NoteCardView.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/17/26.
//

import SwiftUI

struct NoteCardView: View {

    let note: Note

    var onDelete: () -> Void

    var body: some View {

        HStack(alignment: .top, spacing: 14) {

            //
            // AVATAR
            //
            Circle()
                .fill(.blue.opacity(0.2))
                .frame(width: 42, height: 42)
                .overlay {

                    Image(systemName: "person.fill")
                        .foregroundStyle(.blue)
                }

            //
            // MESSAGE CARD
            //
            VStack(
                alignment: .leading,
                spacing: 10
            ) {

                HStack {

                    Text("You")
                        .fontWeight(.semibold)

                    Spacer()

                    Text(
                        note.createdAt.formatted(
                            date: .abbreviated,
                            time: .shortened
                        )
                    )
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }

                Text(note.content)
                    .font(.body)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 18
                )
            )
            .contextMenu {

                Button(
                    role: .destructive
                ) {

                    onDelete()

                } label: {

                    Label(
                        "Delete",
                        systemImage: "trash"
                    )
                }
            }
        }
    }
}
