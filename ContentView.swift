//
//  ContentView.swift
//  Moonshot
//
//  Created by Zakir Ufuk Sahiner on 13.02.24.
//
// 100 Days of SwiftUI Project 8

import SwiftUI

// View for displaying details of each mission
struct MissionDetailsView: View {
    let mission: Mission

    var body: some View {
        VStack {
            Text(mission.displayName)
                .font(.headline)
                .foregroundStyle(.white)

            Text(mission.formattedLaunchDate)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(.lightBackground)
    }
}

// View for displaying each mission item in the grid
struct MissionItemView: View {
    let mission: Mission
    let astronauts: [String: Astronaut]

    var body: some View {
        NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
        } label: {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()

                // Display mission details
                MissionDetailsView(mission: mission)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackground)
            )
        }
    }
}

// Main ContentView
struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        // Display each mission item using the MissionItemView
                        MissionItemView(mission: mission, astronauts: astronauts)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}

