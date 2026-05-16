//
//  ProspectDetailView.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//


import SwiftUI

struct ProspectDetailView: View {

    let prospect: Prospect

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                VStack(alignment: .leading) {

                    Text(prospect.fullName)
                        .font(.largeTitle)

                    Text(prospect.company)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                Divider()

                VStack(
                    alignment: .leading,
                    spacing: 16
                ) {

                    Label(
                        prospect.email,
                        systemImage: "envelope"
                    )

                    Label(
                        prospect.phone,
                        systemImage: "phone"
                    )
                }

                Divider()

                VStack(alignment: .leading) {

                    Text("Notes")
                        .font(.headline)

                    Text(prospect.notes)
                }

                Spacer()
            }
            .padding(30)
        }
    }
}
