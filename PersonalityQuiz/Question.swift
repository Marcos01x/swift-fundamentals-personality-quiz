//
//  Question.swift
//  PersonalityQuiz
//
//  Created by marcos.arroyo on 19/02/24.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
