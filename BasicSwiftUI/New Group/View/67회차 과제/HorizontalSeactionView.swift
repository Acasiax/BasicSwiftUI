//
//  HorizontalSeactionView.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/5/24.
//

import SwiftUI

struct HorizontalSeactionView: View {
    var body: some View {
            ScrollView(.horizontal){
                LazyHStack {
                    ForEach(0..<6) { item in
                        PosterView()
                            .cornerRadius(20)
                    }
                }
            }
        }
    }




struct PosterView: View {
    
    let url = URL(string: "https://picsum.photos/200/300")
    
    var body: some View {
        VStack{
            if let url = url {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 200, height: 300)
                        
                    case .success(let image):
                        image
                            .frame(width: 200, height: 300)
                        
                    case .failure(let error):
                        Image(systemName: "star")
                            .frame(width: 200, height: 300)
                        
                    @unknown default:
                        Image(systemName: "star")
                            .frame(width: 200, height: 300)
                    }
                    
                }
            } else {
                Image(systemName: "star")
                    .frame(width: 200, height: 300)
            }
        }
    }
}
