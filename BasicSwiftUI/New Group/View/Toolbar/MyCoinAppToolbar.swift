//
//  MyCoinAppToolbar.swift
//  BasicSwiftUI
//
//  Created by 이윤지 on 9/3/24.
//

import SwiftUI

struct MyCoinAppToolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              
            }, label: {
                Image(systemName: "pawprint")
            })
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Image(systemName: "person")
        }
    }
}
