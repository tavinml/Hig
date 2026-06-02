//
//  ContentView.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 01/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            bar()
                .navigationSplitViewColumnWidth(
                    min: 150, ideal: 200 , max: 300)
        }
        detail: {
            VStack {
                HStack(alignment: .center, spacing: 20 ) {
                    Card1()
                    Card1()
                    
                }
            }
            
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
