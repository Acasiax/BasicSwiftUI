//
//  CoinDummy.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/2/24.
//

import Foundation

struct CoinDummy: Hashable, Identifiable {
    var id = UUID()
    var coinName: String
    var price: Double
}


let coins = [
    CoinDummy(coinName: "Bitcoin", price: 70000000),
    CoinDummy(coinName: "Ethereum", price: 40000000),
    CoinDummy(coinName: "Doge", price: 170),
    CoinDummy(coinName: "Fincia", price: 200)
]
