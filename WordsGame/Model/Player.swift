//
//  Player.swift
//  WordsGame
//
//  Created by Даниил Попов on 04.07.2023.
//

import Foundation

struct Player {
    
    let name: String
    private(set) var score = 0
    
    mutating func add(score: Int) {
        self.score += score
    }
}
