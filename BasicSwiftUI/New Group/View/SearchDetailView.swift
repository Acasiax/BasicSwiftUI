//
//  SearchDetailView.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/3/24.
//

import SwiftUI

struct SearchDetailView: View {
    
    let data: String
    
    var body: some View {
        Text("서치디테일뷰 \(data)")
        Button("버튼") {
          
        }
    }
    
    init(data: String) {
        self.data = data
        print("서치디테일뷰우 \(data)")
    }
}
