//
//  MyRandomImage.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/5/24.
//

import SwiftUI

struct MyRandomImageHomeView: View {
    
    @State var list = SessionModel.sessionList
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(list, id: \.self) { item in
                    
                    NavigationLink {
                        MyRandomDetailView(seactionTitle: item)
                        
                    } label: {
                        makeSection(item)
                    }
                    
                }
            }
            .navigationTitle("네비 타이틀")
        }
    }
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


#Preview {
    MyRandomImageHomeView()
}


struct MyRandomDetailView: View {
    
    var seactionTitle: String
    
    var body: some View {
     Text(seactionTitle)
    }
}
