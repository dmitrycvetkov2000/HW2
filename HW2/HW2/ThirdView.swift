//
//  ThirdView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 22.09.2023.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack {
            Text("Third view")
            NavigationPopButton(destination: .previous) {
                Text("Назад")
            }
            NavigationPopButton(destination: .root) {
                Text("К самому началу")
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
