//
//  FinalScreenBrain.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 09.02.2023.
//

import Foundation

struct FinalScreenBrain {
    
    func checkWonMoney(money: Int) -> Bool {
        if money == 1000 || money == 32000 || money == 1000000 {
            return true
        }
        return false
    }
    
}
