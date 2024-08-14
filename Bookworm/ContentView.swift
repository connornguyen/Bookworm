//
//  ContentView.swift
//  Bookworm
//
//  Created by Apple on 13/08/2024.
//

import SwiftUI

struct PushButton: View {
    let tittle: String
    @Binding var showingButton: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color.black, Color.white]
    
    var body: some View {
        Button(tittle) {
            showingButton.toggle()
        }
        .padding()
        .background(LinearGradient(colors: showingButton ? onColors : offColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(.capsule)
        .foregroundStyle(.white)
        
    }
}



struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack {
           PushButton(tittle: "HelloWorld", showingButton: $isOn)
            Text(isOn ? "On" : "Off")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
