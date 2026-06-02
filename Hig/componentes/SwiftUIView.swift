//
//  SwiftUIView.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 02/06/26.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 20,height: 19)
        }
//        .frame(minWidth: 50, minHeight: 50)

    }
}

#Preview {
    SwiftUIView()
}
