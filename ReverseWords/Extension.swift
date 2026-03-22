
//
//  Extension.swift
//  ReverseWords
//
//  Created by Nikita on 22.01.2026.
//

extension String {
    
    var withReversedWords: String {
        
        let userText = self.split(separator: " ")
        
                var newArray: [String] = []
                for words in userText {
                    var char = Array("\(words)")
                    char.reverse()
                    let temporary = String(char)
                    newArray.append(temporary)
                }
        
                let resultText = newArray.joined(separator: " ")
                return resultText
        
            }
    }
