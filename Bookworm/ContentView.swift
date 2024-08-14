//
//  ContentView.swift
//  Bookworm
//
//  Created by Apple on 13/08/2024.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    
    
    
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
