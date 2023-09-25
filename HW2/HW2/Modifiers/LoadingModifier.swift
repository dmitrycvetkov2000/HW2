//
//  LoadingModifier.swift
//  HW2
//
//  Created by Дмитрий Цветков on 25.09.2023.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    let isloading: Bool
    
    func body(content: Content) -> some View {
        if isloading {
            VStack {
                content
                ProgressView()
            }
        } else {
            content
        }
    }
}
