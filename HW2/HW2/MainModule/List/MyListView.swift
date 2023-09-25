//
//  MyListView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

struct MyListView: View {
    @Binding var selectedContent: Contents
    @ObservedObject var viewModel: MainViewModel
    @EnvironmentObject var navigation: NavigationStackViewModel
    
    @State var tap: String = ""
    
    var list: some View {
        List(viewModel.laureates, id: \.id) { str in
            let isLast = viewModel.laureates.isLastElement(str)
            let isLoading = viewModel.inProgress && !viewModel.isFinished && isLast
            
            CustomRow(text: str.name, isloading: isLoading)
                .modifier(LoadingModifier(isloading: isLoading))
                .onAppear {
                    if isLast {
                        viewModel.getLaureates(category: selectedContent)
                    }
                }
                .onTapGesture {
                    withAnimation(.default.speed(0.1)) {
                        tap = str.id.debugDescription
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        navigation.push(screen: SecondView(str: str.name))
                    }
                }
                .offset(x: tap == str.id.debugDescription ? -1000 : 0, y: tap == str.id.debugDescription ? 1000 : 0)
                .rotationEffect(Angle(radians: tap == str.id.debugDescription ? 10 : 0))
        }
    }
    
    var body: some View {
        list
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView(selectedContent: .constant(.first), viewModel: .init())
    }
}
