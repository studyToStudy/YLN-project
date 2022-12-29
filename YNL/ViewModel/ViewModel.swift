//
//  ViewModel.swift
//  YNL
//
//  Created by 이정후 on 2022/12/29.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
}
