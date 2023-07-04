//
//  GameView.swift
//  WordsGame
//
//  Created by Даниил Попов on 03.07.2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    var viewModel: GameViewModel
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State var alertText = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("Mettal"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Bold",
                                      size: 18))
            }
                Spacer()
            }
            
            Text("\(viewModel.word)")
                .font(.custom("AvenirNext-Bold",
                              size: 30))
                .foregroundColor(.white)

            HStack(spacing: 12) {
                
                VStack {
                    
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 60))
                        .foregroundColor(.white)
                    
                    Text("\(viewModel.player1.name)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 24))
                        .foregroundColor(.white)
                    
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(26)
                    .shadow(color: .red,
                            radius: 4,
                            x: 0,
                            y: 0)
                
                VStack {
                    
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 60))
                        .foregroundColor(.white)
                    
                    Text("\(viewModel.player2.name)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 24))
                        .foregroundColor(.white)
                    
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("SecondColor"))
                    .cornerRadius(26)
                    .shadow(color: .purple,
                            radius: 4,
                            x: 0,
                            y: 0)
                
            }
            
            WordsTextField(word: $word,
                           placeholder: "Ваше слово...")
            .padding(.horizontal)
            
            Button {
                
                var score = 0
                
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.theSameWord {
                        alertText = "Думаешь самый умный? Составленное слово не должно быть исходным словом!"
                    isAlertPresent.toggle()
                } catch WordError.beforeWord {
                    alertText = "Прояви фантазию! Придумай новое слово, которое не было составленно ранее!"
                isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "Слишком короткое слово"
                isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "Такое слово не может быть составленно"
                isAlertPresent.toggle()
                } catch {
                    alertText = "Неизвестная ошибка"
                isAlertPresent.toggle()
                }
                
                
                if score > 1 {
                    self.word = ""
                }
            } label: {
                Text("Готово!")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("Mettal"))
                    .cornerRadius(12)
                    .font(.custom("AvenirNext-Bold", size: 26))
                    .padding(.horizontal)
            }

            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity,
                        maxHeight: .infinity)
            
        }.background(Image("background"))
            .confirmationDialog("Вы уверены, что хотите завершить игру?",
                                isPresented: $confirmPresent,
                                titleVisibility: .visible) {
                Button(role: .destructive) {
                    self.dismiss()
                } label: {
                    Text("Да")
                }

                Button(role: .cancel) { } label: {
                    Text("Нет")
                }
            }
                .alert(alertText,
                 isPresented: $isAlertPresent) {
                 Text("Ок, понял...")
            }
     }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Вася"),
                                         player2: Player(name: "Петя"),
                                         word: "Инкапсуляция"))
    }
}
