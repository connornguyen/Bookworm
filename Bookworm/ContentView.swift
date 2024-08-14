//
//  ContentView.swift
//  Bookworm
//
//  Created by Apple on 13/08/2024.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var books: [Book]
    @State private var showingAddingScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddingScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddingScreen) {
                    AddBookView()
                }
        }
    }
}

//This modelContatiner need to be implement here, in order for preview to work.
#Preview {
    ContentView()
        .modelContainer(for: Book.self)
}
