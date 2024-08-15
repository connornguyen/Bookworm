//
//  DetailView.swift
//  Bookworm
//
//  Created by Apple on 15/08/2024.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.8))
                    .clipShape(Capsule())
                    .offset(x: -10, y: -10)
            }
            Text(book.title)
                .font(.title.bold())
                
                
            
            Text(book.author)
                .font(.title3)
            
            Text(book.review)
                .font(.headline)
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test", author: "TEst", genre: "Fantasy", review: "Test", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Error, \(error.localizedDescription)")
    }
}
