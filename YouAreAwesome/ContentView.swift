//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Hyunjin Kim on 11/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var messageNumber = 0
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
            
           
            Button("Show Message") {
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "Fabulous? That's You!",
                                "You are fantastic!",
                                "When the Genius Bar needs help, they call you!"]
                
                /* Code from the lecture
                message = messages[messageNumber]
                messageNumber += 1
                if (messageNumber == messages.count-1) {
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                if (imageNumber > 9) {
                    imageNumber = 0
                }
                */
                
                message = messages[messageNumber]
                messageNumber = (messageNumber == messages.count - 1) ? 0: messageNumber + 1;
                imageName = "image\(imageNumber)"
                imageNumber = (imageNumber == 9) ? 0: imageNumber + 1;
                
                print(imageNumber)
            
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





