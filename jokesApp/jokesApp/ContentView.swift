//
//  ContentView.swift
//  jokesApp
//
//  Created by Vijayaganapathy Pavithraa on 29/6/24.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [Joke(setup: "Why couldn't the bicycle stand up?",
                      punchline: "It was two tired!"),
                 Joke(setup: "Why did the chicken cross the road?",
                      punchline: "To get to the other side!"),
                 Joke(setup: "Is this pool safe for diving?",
                      punchline: "It deep ends"),
                 Joke(setup: "Did you hear about the cheese factory that exploded in France?",
                      punchline: "There was nothing left but de Brie"),
                 Joke(setup: "Dad, can you put my shoes on?",
                      punchline: "I don’t think they'll fit me")]
    
    @State private var showPunchline = false
    @State private var currentJoke = 0
    @State private var isFeedbackPresented = false
    @State private var displaySheet = false
    @State private var isPositive = false
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .onTapGesture {
                    if showPunchline{
                        currentJoke += 1
                        showPunchline = false
                        isFeedbackPresented = true
                    }
                }
            VStack {
                Text(jokes[currentJoke % jokes.count].setup)
                    .padding()
                Button{
                    print("Button Tapped!")
                    showPunchline = true
                }label:{
                    Text("WHAT? **_TELL ME_!!**")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                }
                .padding()
                
                if showPunchline {
                    Text(jokes[currentJoke % jokes.count].punchline)
                        .padding()
                        .opacity(showPunchline ? 1 : 0)
                    
                    Text("Tap to continue")
                        .padding()
                        .hidden()
                        .italic()
                        .opacity(showPunchline ? 1 : 0)
                }
            }
        }
        .alert("Did you like the last joke?",
               isPresented: $isFeedbackPresented){
            Button("😍"){
                print("cool")
                isPositive = true
                displaySheet = true
            }
            Button("😔") {
                print("Ok I hate you I hate you I hate you")
                isPositive = false
                displaySheet = true
            }
            
        }
               .sheet(isPresented: $displaySheet) {
                   FeedbackResponseView(isPositive: isPositive)
               }
    }
}
#Preview {
    ContentView()
}

