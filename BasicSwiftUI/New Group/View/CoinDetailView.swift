//
//  CoinDetailView.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/3/24.
//

import SwiftUI

struct CoinDetailView: View {
    var coin: Market
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
         
            Text(coin.koreanName)
                .font(.largeTitle)
                .fontWeight(.bold)
            

            Text("Market: \(coin.market)")
                .font(.title2)
                .foregroundColor(.gray)

        }
        .padding()
        .navigationTitle(coin.koreanName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

