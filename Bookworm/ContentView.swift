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
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                        }
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
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
