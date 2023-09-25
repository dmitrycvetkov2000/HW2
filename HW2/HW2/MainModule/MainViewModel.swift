//
//  MainViewModel.swift
//  HW2
//
//  Created by Дмитрий Цветков on 22.09.2023.
//

import SwiftUI
import NewsApiNetworking

class MainViewModel: ObservableObject {
    @Published var laureates: [LaureateDataSource] = []
    @Published var inProgress: Bool = false
    @Published var isFinished: Bool = false
    
    var limit = 25
    
    func fillMass(category: Contents) {
        guard inProgress == false else { return }
        self.laureates.removeAll()
        
        getLaureates(category: category)
    }
    
    func getLaureates(category: Contents) {
        inProgress = true
        let category = convertCategories(category: category)
        DefaultAPI.laureatesGet(offset: laureates.count, limit: limit, nobelPrizeCategory: category) { [weak self] data, error in
            guard let self = self, let data = data, let laureates = data.laureates else { return }
            laureates.forEach {
                self.laureates.append(.init(laureate: $0))
            }
            self.inProgress = false
            self.isFinished = data.links?.next == nil
        }
    }
    
    fileprivate func convertCategories(category: Contents) -> DefaultAPI.NobelPrizeCategory_laureatesGet {
        switch category {
        case .first: return .che
        case .second: return .med
        case .third: return .eco
        }
    }
}

