//
//  ContentView.swift
//  WordsGame
//
//  Created by Даниил Попов on 03.07.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    @State var isShowGame = false
    
    var body: some View {
        
        VStack {
            
            TitleText(text: "Words Game")
            
            WordsTextField(word: $bigWord,
                           placeholder: "Введите длинное слово")
            .padding()
            .padding(.top, 32)
            
            WordsTextField(word: $player1,
                           placeholder: "Игрок 1")
            .cornerRadius(12)
            .padding(.horizontal, 20)
            
            WordsTextField(word: $player2,
                           placeholder: "Игрок 2")
            .cornerRadius(12)
            .padding(.horizontal, 20)
            
            Button {
                isShowGame.toggle()
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(12)
                    .padding(.top)
            }

            
        }.background(Image("background"))
            .fullScreenCover(isPresented: $isShowGame) {
                GameView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
