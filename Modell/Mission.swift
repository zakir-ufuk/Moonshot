//
//  Mission.swift
//  Moonshot
//
//  Created by Zakir Ufuk Sahiner on 13.02.24.
//

import Foundation

// Nested Struct it is useful to help to keep code organized
struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    // If there is a launchDate in JSON file format it otherwise use N/A
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
