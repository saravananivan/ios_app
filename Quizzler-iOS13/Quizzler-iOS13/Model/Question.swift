//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mac on 2/16/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

struct Question{
    let text: String
    let answer  :String
    
    init(q : String, a  :String) {
        self.text = q
        self.answer = a
    }
}
