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
//            PopupFinished()
            Bar()
                .frame(minWidth: 950, minHeight: 700)


        }
        .windowResizability(.contentMinSize)
    }
}
