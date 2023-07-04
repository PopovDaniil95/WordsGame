//
//  TitleText.swift
//  WordsGame
//
//  Created by Даниил Попов on 03.07.2023.
//

import SwiftUI

struct TitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .font(.custom("AvenirNext-Bold", size: 42))
            .foregroundColor(.white)
        
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "Text")
    }
}
