//
//  HigApp.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 01/06/26.
//

import SwiftUI

@main
struct HigApp: App {
    var body: some Scene {
        WindowGroup {

            bar()
                .frame(minWidth: 950, minHeight: 600)
//            Wrong1()
        }
        .windowResizability(.contentMinSize)
    }
}
