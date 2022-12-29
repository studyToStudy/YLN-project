//
//  Picker.swift
//  YNL
//
//  Created by 이정후 on 2022/12/29.
//

import Foundation

enum Picker {
    enum Source: String {
        case library, camera
    }
}

// StorageType 설정
enum StorageType {
    case userDefaults
    case fileSystem
}
