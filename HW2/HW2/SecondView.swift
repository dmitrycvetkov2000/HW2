//
//  SecondView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var navigation: NavigationStackViewModel
    
    var str: String
    
    var body: some View {
        VStack {
            Text("Second screen \(str)")
                .background(Color.green)
            NavigationPushButton(destination: ThirdView()) {
                Text("Подробнее")
            }.onTapGesture {
                navigation.push(screen: ThirdView())
            }
            NavigationPopButton(destination: .root) {
                Text("Назад")
            }
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(str: "")
    }
}
