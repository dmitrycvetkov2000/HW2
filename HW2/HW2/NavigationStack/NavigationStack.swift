//
//  NavigationStack.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

struct NavigationStack<Content>: View where Content: View {
    @StateObject var viewModel: NavigationStackViewModel = .init()
    
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        ZStack {
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(.scale)
            default:
                viewModel.currentScreen?.nextScreen
                    .environmentObject(viewModel)
                    .transition(.scale)
            }
        }
    }
}

//struct NavigationStack_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack()
//    }
//}
