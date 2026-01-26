//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Hyunjin Kim on 11/1/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer : AVAudioPlayer!
    
    let numOfImages = 10
    let numOfSounds = 6
    
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
            
            Spacer()
            
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
                
                // Change message when button is pressed
                var messageNumber : Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                lastMessageNumber = messageNumber
                message = messages[messageNumber]
                
                // Change image when button is pressed
                var imageNumber : Int
                repeat {
                    imageNumber = Int.random(in:0...numOfImages-1)
                } while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
                imageName = "image\(imageNumber)"
                
                // Change sound when button is pressed
                var soundNumber : Int
                repeat {
                    soundNumber = Int.random(in:0...numOfSounds-1)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                soundName = "sound\(soundNumber)"
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("ERROR: \(error.localizedDescription) creating audio player")
                }
                
                print("Current sound name is \(soundName)")
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





