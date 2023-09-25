//
//  CustomRow.swift
//  HW2
//
//  Created by Дмитрий Цветков on 22.09.2023.
//

import SwiftUI

struct CustomRow: View, Identifiable {
    var id = UUID()
    
    var text: String
    let isloading: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.mint)
            VStack {
                NavigationPushButton(destination: SecondView(str: text)) {
                    Text(text)
                }
            }

        }
    }
}

struct CustomRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomRow(text: "", isloading: false)
    }
}
