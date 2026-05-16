//
//  ActivityCard.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//


import SwiftUI

struct ActivityCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(
            spacing: 12
        ) {

            Image(systemName: icon)
                .font(.title)

            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(title)
                .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity
        )
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
    }
}
