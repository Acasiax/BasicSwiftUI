//
//  SearchView.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/2/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(coins) { coin in
                    NavigationLink {
                        SearchDetailView(data: coin.coinName)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(coin.coinName)
                            Text("\(coin.price, specifier: "%.2f")원")
                                .font(.subheadline)
                                .coinTextStyle(coin: coin)
                        }
                    }
                }
            }
            .navigationTitle("코인 검색")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $text, placement: .navigationBarDrawer, prompt: "코인 이름을 검색해보세요")
            .toolbar {
                MyCoinAppToolbar()
            }
        }
    }
}

#Preview {
    SearchView()
}

