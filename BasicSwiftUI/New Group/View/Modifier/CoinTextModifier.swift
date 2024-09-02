//
//  CoinTextModifier.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/3/24.
//

import SwiftUI

struct CoinTextModifier: ViewModifier {
    let coin: CoinDummy
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .foregroundStyle(.green)
        } else {
            content
                .foregroundColor(.green)
        }
    }
}

extension View {
    func coinTextStyle(coin: CoinDummy) -> some View {
        self.modifier(CoinTextModifier(coin: coin))
    }
}
