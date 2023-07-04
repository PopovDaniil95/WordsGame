//
//  WordsTextField.swift
//  WordsGame
//
//  Created by Даниил Попов on 03.07.2023.
//

import SwiftUI

struct WordsTextField: View {
    
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder,
                  text: word)
        .font(.title)
        .padding(20)
        .background(.white)
        .cornerRadius(12)    }
}


