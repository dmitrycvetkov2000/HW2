//
//  PickerView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 22.09.2023.
//

import SwiftUI

struct PickerView: View {
    @Binding var selectedContent: Contents
    
    var body: some View {
        VStack {
            Picker("Выберете контент", selection: $selectedContent) {
                ForEach(Contents.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }

            .pickerStyle(.segmented)
            .padding()
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(selectedContent: .constant(.first))
    }
}
