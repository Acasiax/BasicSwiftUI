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





extension SearchView {
    
    func bannerView() -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.green)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.green)
                        .overlay {
                            Circle()
                                .fill(.white.opacity(0.3))
                                
                        }
                        .scaleEffect(2)
                        .offset(x: -60, y: 10.0)
                }
                .clipShape( RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
                .padding()
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비 내역")
                    .font(.callout)
                Text("345,680,230원")
                    .font(.title).bold()
            }
            .foregroundStyle(.white)
            .padding(40)
            .frame(maxWidth: .infinity, alignment: .leading)
     
            
           
           
            
            
        }
       

    }
    
}
