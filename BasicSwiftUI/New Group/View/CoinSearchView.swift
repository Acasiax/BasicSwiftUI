//
//  CoinSearchView.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/3/24.
//

import SwiftUI

struct CoinSearchView: View {
    
    @State private var text = ""
    @State var market: Markets = []
    @State var isStarred = false
    
    var filterCoinName: [Market] {
        return text.isEmpty ? market : market.filter { $0.koreanName.contains(text) }
    }
    
    var body: some View {
        ZStack{
            Color.pink.ignoresSafeArea(.all)
            NavigationView{
                ScrollView {
                    listView()
                    
                }
                
                .foregroundStyle(.white)
                .background(.black)
                
                .navigationTitle("Search")
                .navigationBarTitleTextColor(.white)
                
                
                
                .searchable(text: $text, placement: .navigationBarDrawer, prompt: "코인 이름을 검색해보세요")
                
            } .task{
                do {
                    let result = try await UpbitAPI.fetchMarket()
                    market = result
                } catch {
                    
                }
            }
        }
    }
    
}

#Preview {
    CoinSearchView()
}



extension CoinSearchView {
    
    func rowView(_ item: Market) -> some View {
        
        HStack{
            Image(systemName: "bitcoinsign.circle")
            
            VStack(alignment: .leading){
                Text(item.koreanName)
                    .fontWeight(.bold)
                //.foregroundStyle(.gray)
                Text(item.market)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button(action: {
                if let index = market.firstIndex(where: { $0.market == item.market }) {
                    market[index].isStarred.toggle()
                }
            }) {
                
                Image(systemName: item.isStarred ? "star.fill" : "star")
                //  .foregroundStyle(.white)
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        
    }
    
    func listView() -> some View {
        LazyVStack{
            ForEach(filterCoinName, id: \.id ){ item in
               // NavigationLink는 ForEach문 내부에서 하기
                NavigationLink(destination: CoinDetailView(coin: item)) {
                    rowView(item)
                }
                Divider()
                    .background(Color.gray)
                
                
            }
        }
    }
    
    
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
