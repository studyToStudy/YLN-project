//
//  YNLApp.swift
//  YNL
//
//  Created by 이정후 on 2022/12/27.
//

import SwiftUI

@main
struct YNLApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(ViewModel())
        }
    }
}
