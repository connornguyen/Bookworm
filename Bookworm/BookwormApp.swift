//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Apple on 13/08/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Book.self)
        }
    }
}
