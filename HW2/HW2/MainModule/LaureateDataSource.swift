//
//  LaureateDataSource.swift
//  HW2
//
//  Created by Дмитрий Цветков on 25.09.2023.
//

import Foundation
import NewsApiNetworking

final class LaureateDataSource {
    fileprivate let unknown = "unknown"

    let name: String
    let gender: String
    let birthDate: String
    let deathDate: String
    let birthCountry: String
    let deathCountry: String

    init(laureate: Laureate) {
        name = laureate.fullName?.en ?? unknown
        gender = laureate.gender?.rawValue ?? unknown
        birthDate = laureate.birth?.date ?? unknown
        deathDate = laureate.death?.date ?? unknown
        birthCountry = laureate.birth?.place?.country?.en ?? unknown
        deathCountry = laureate.death?.place?.country?.en ?? unknown
    }
}

extension LaureateDataSource: Identifiable { }
