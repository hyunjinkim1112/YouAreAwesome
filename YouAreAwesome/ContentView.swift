//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Hyunjin Kim on 11/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            
            Button("Show Message") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
            
                message = (message == message1 ? message2: message1)
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
//                print(imageNumber)
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}





