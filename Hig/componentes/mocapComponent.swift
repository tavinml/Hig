//
//  mocapComponent.swift
//  hig_testes
//
//  Created by Ana Soares on 06/06/26.
//

import SwiftUI

struct mocapComponent: View {
    var body: some View {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding(10)
                    .frame(maxWidth: 300, maxHeight: 700)
                    .background(Color.gray.opacity(0.1))
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
//            .frame(width: geometry.size.width * 0.6)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity, alignment: .topTrailing)
            .background(Color.blue.opacity(0.1))
    }
}

#Preview {
    mocapComponent()
}
