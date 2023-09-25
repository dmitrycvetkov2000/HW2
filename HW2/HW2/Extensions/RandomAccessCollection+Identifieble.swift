//
//  RandomAccessCollection+Identifieble.swift
//  HW2
//
//  Created by Дмитрий Цветков on 25.09.2023.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func isLastElement<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id)}) else { return false }
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}
