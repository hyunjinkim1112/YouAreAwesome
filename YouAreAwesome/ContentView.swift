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
    @State private var soundIsOn = false
    
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
            
            HStack {
                Text("Sound on: ")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                    
                Spacer()
                
                Button("Show Message") {
                    let messages = ["You are Awesome!",
                                    "You are Great!",
                                    "Fabulous? That's You!",
                                    "You are fantastic!",
                                    "When the Genius Bar needs help, they call you!"]
                    
                    // Change message when button is pressed
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    // Change image when button is pressed
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    // Change sound when button is pressed
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numOfSounds-1)
                    soundName = "sound\(lastSoundNumber)"
                    print("sound name is \(soundName)")
                    if soundIsOn {
                        playAudio(soundName: soundName)
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accentColor)
        }
        .padding()
    }
    
    func nonRepeatingRandom (lastNumber: Int, upperBounds: Int) -> Int {
        var randomNumber : Int
        repeat {
            randomNumber = Int.random(in: 0...upperBounds)
        } while lastNumber == randomNumber
        return randomNumber
    }
    
    func playAudio (soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
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
                
    }
}

#Preview("Light Mode"){
    ContentView()
        .preferredColorScheme(.light)
}
#Preview("Dark Mode"){
    ContentView()
        .preferredColorScheme(.dark)
}





