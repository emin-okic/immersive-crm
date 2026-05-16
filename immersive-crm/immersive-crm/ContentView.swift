//
//  ContentView.swift
//  immersive-crm
//
//  Created by Emin Okic on 5/16/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext)
    private var modelContext

    @Query(sort: \Prospect.createdAt, order: .reverse)
    private var prospects: [Prospect]

    @State private var selectedProspect: Prospect?

    @State private var showingAddSheet = false

    var body: some View {

        NavigationSplitView {

            List(selection: $selectedProspect) {

                ForEach(prospects) { prospect in

                    NavigationLink(value: prospect) {

                        VStack(
                            alignment: .leading,
                            spacing: 4
                        ) {

                            Text(prospect.fullName)
                                .font(.headline)

                            if !prospect.company.isEmpty {

                                Text(prospect.company)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                    .tag(prospect)
                }
            }
            .navigationTitle("Rolodex")
            .toolbar {

                ToolbarItem {

                    Button {

                        showingAddSheet = true

                    } label: {

                        Label(
                            "Add Prospect",
                            systemImage: "plus"
                        )
                    }
                }
            }

        } detail: {

            if let selectedProspect {

                ProspectDetailView(
                    prospect: selectedProspect
                )

            } else {

                ContentUnavailableView(
                    "Select a Prospect",
                    systemImage: "person.crop.circle"
                )
            }
        }
        .sheet(isPresented: $showingAddSheet) {

            AddProspectView()
        }
    }
}

#Preview(windowStyle: .automatic) {

    ContentView()
}
