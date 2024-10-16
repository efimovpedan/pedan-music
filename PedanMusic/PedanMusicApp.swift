//
//  PedanMusicApp.swift
//  PedanMusic
//
//  Created by Andrey Pedan on 02.10.2024.
//

import SwiftUI
import SwiftData

@main
struct PedanMusicApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TrackSearchView()
        }
        .modelContainer(sharedModelContainer)
    }
}
