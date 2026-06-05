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
            VStack {
                CardDotted(selected: true, height: 62, exerciseNumber: "1")
                    .frame(maxWidth: 300, maxHeight: 300)
                CardDotted(selected: true, height: 100, exerciseNumber: "2")
                    .frame(maxWidth: 300, maxHeight: 199)
                CardDotted(selected: true, height: 62, exerciseNumber: "3")
                    .frame(maxWidth: 300, maxHeight: 300)

            }
//            .padding()
//            ContentView()
////            
//            CardDotted(selected: true, height: 62, exerciseNumber: "1")
//                .frame(maxWidth: 300, maxHeight: 300)
        }
    }
}
