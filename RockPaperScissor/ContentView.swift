//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Tuğberk Ata on 16.06.2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var RPS = ["🪨", "📄", "✂️"]
    @State private var userPick = ""
    @State private var computerCurrent = ""
    @State private var gameWin = false
    @State private var showScore = false
    @State private var gameoverMessage = ""
    @State private var gameScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .mint]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack {
                Text("Rock Paper Scissor")
                    .bold()
                    .font(.system(size:30))
                    .padding(0.3)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                Text("Pick One")
                    .bold()
                    .font(.system(size:25))
                    .frame(maxWidth: 150)
                    .background(.ultraThinMaterial)
                VStack {
                    ForEach(0..<3) { number in
                        Button {
                            gameLoop(number)
                        }
                    label: {
                        Text(String(RPS[number]))
                            .font(.system(size:150))
                    }
                    }
                }
            }
            .frame(width: 330, height: 680, alignment: .top)
            .background(.thinMaterial)
            .alert("\(gameoverMessage)", isPresented: $showScore){
                Button("Play Again", action: computerPick)
            }
        message: {
            Text("The computer picked \(computerCurrent) \n Your Score Is \(gameScore)")
        }
        .onAppear {
            computerPick()
        }
        }
    }
    func resetGame() {
        userPick = ""
        computerCurrent = ""
    }
    
    func gameLoop(_ number: Int) {
        if RPS[number] == computerCurrent {
            gameoverMessage = "You Drew"
            showScore = true
            return
        }
        if RPS[number] == "🪨" {
            if computerCurrent == "✂️"{
                gameWin = true
            }
            else {
                gameWin = false
            }
        }
        if RPS[number] == "✂️" {
            if computerCurrent == "📄"{
                gameWin = true
            }
            else {
                gameWin = false
            }
        }
        if RPS[number] == "📄" {
            if computerCurrent == "🪨"{
                gameWin = true
            }
            else {
                gameWin = false
            }
        }
        if gameWin == true {
            gameScore += 1
            gameoverMessage = "You Won Congrats!"
        }
        else {
            if gameScore >= 1 {
                gameScore -= 1
            }
            gameoverMessage = "You Lost Try Again.."
        }
        showScore = true
    }
    
    func computerPick() {
        resetGame()
       computerCurrent = RPS[Int.random(in: 0..<3)]
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
