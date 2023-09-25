//
//  NavigationStackViewModel.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

enum PopDistination {
    case previous, root
}

final class NavigationStackViewModel: ObservableObject {
    var easing: Animation = .easeInOut(duration: 0.7)
    @Published var currentScreen: Screen?
    var screenStack: ScreenStack = .init() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    func push<S: View>(screen: S) {
        withAnimation {
            let screen: Screen = .init(id: UUID().uuidString, nextScreen: AnyView(screen))
            screenStack.push(screen: screen)
        }
    }
    
    func pop(to: PopDistination) {
        withAnimation {
            switch to {
            case .previous:
                screenStack.popToPrevious()
            case .root:
                screenStack.popToRoot()
            }
        }
    }
}
