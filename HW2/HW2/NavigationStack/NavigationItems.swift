//
//  NavigationItems.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

struct NavigationPushButton<Content, Destination>: View where Content: View, Destination: View {
    @EnvironmentObject var viewModel: NavigationStackViewModel
    let content: Content
    let destination: Destination
    
    init(destination: Destination, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.destination = destination
    }
    
    var body: some View {
        content
    }
}

struct NavigationPopButton<Content>: View where Content: View {
    @EnvironmentObject var viewModel: NavigationStackViewModel
    let content: Content
    let destination: PopDistination
    
    init(destination: PopDistination, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.destination = destination
    }
    
    var body: some View {
        content.onTapGesture {
            viewModel.pop(to: destination)
        }
    }
    
}
