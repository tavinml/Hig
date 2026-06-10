//
//  HomeView.swift
//  Hig
//
//  Created by Ana Soares on 07/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            
            HStackLayoutView()
                .frame(minWidth: 1240)
            
            MediumLayoutView()
                .frame(minWidth: 800)
            
            VStackLayoutView()
            
            
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
