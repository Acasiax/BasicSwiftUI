//
//  MyRandomImage.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/5/24.
//

import SwiftUI

struct MyRandomImageHomeView: View {
    
   @State var list = [
    "첫번째 세션", "두번째 세션", "세번째 세션"
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(list, id: \.self) { item in
                    
                    NavigationLink {
                        
                        MyRandomDetailView(seactionTitle: item)
                        
                    } label: {
                        
                        makeSection(item)
                    }

                  //  makeSection(item)
                    
                }
            }
            .navigationTitle("네비 타이틀")
        }
    }
}

#Preview {
    MyRandomImageHomeView()
}


extension MyRandomImageHomeView {
    
    func makeSection(_ title: String) -> some View {
        VStack{
           Text(title)
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizontalSeactionView()
                .padding(.leading)
            
        }
    }
    
}


struct MyRandomDetailView: View {
    
    var seactionTitle: String
    
    var body: some View {
     Text(seactionTitle)
    }
}
