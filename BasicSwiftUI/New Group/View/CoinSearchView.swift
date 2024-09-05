//
//  CoinSearchView.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/3/24.
//

import SwiftUI

// MARK: - 배너
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
                    horizontalBannerView()
                    listView()
                    
                    
                }
                .refreshable {
                    //
                }
                .foregroundStyle(.white)
                .background(.black).opacity(0.7)
                
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
    
    func horizontalBannerView() -> some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(filterCoinName, id: \.id) {item in
                    bannerView(item)
                      //  .containerRelativeFrame(.horizontal) //기기의 수평길이에 맞춰서 늘려주는 거
                }
            }
            .scrollTargetLayout() // 타켓 포커싱
        }
        // 포커싱타켓.scrollTargetLayout() 포커싱이 동작하게 하려면 .scrollTargetBehavior(.viewAligned)가 있어야 함🌟
        .scrollTargetBehavior(.viewAligned) // .paging으로 하면 살짝 밀림/ .viewAligned -> 스크롤뷰 기준으로 보여주는 것을 센터에 맞춰주는데 이 기준을 맞춰주기 위해  .scrollTargetLayout()에 필요한 거
        
        .scrollIndicators(.hidden) //인디게이터 안보이게 하기
    }
    
    
    
    func bannerView(_ banner: Market) -> some View {
        
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(banner.color)
                    .overlay(alignment: .leading) {
                                Circle()
                            .fill(.white.opacity(0.3))
                                    .scaleEffect(2)
                                    .offset(x: -60, y: 10.0)
                                    
                            }
                            
                    
                    .clipShape( RoundedRectangle(cornerRadius: 25))
                    .frame(height: 150)
                    .padding()
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text(banner.koreanName)
                        .font(.callout)
                    Text(banner.market)
                        .font(.title).bold()
                }
                .foregroundStyle(.white)
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
    }
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

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1)
        )
    }
}
