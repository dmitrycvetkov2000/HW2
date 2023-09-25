//
//  ContentView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

struct MainView: View {
    @State var selectedContent: Contents = .first
    @StateObject var viewModel = MainViewModel()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .cyan
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                PickerView(selectedContent: $selectedContent)
                
                let list = MyListView(selectedContent: $selectedContent, viewModel: viewModel)
                switch selectedContent {
                case .first:
                    get(laureates: list)
                case .second:
                    get(laureates: list)
                case .third:
                    get(laureates: list)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    fileprivate func get(laureates: MyListView) -> some View {
        laureates
            .onAppear {
                viewModel.fillMass(category: selectedContent)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
