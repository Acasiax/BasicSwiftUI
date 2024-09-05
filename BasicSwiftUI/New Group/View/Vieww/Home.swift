//
//  Home.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/5/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Circle()
                    .fill(.red)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("비트코인")
                        .font(.callout)
                    Text("BTC")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func CustomControl() -> some View {
        
        let coins = ["BTC","ETH","Doge"]
        ScrollView {
            
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
