//
//  random_quran_verseApp.swift
//  random quran verse
//
//  Created by Iman Morshed on 11/7/23.
//

import SwiftUI

@main
struct random_quran_verseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GenerateAyah()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
