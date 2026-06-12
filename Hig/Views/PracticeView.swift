//
//  PracticeView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {

        GeometryReader { geometry in
            HStack {
                MocapComponent()
                    .frame(width: geometry.size.width * 0.6)
                ChatComponent()
                    .frame(width: geometry.size.width * 0.4)
            }
        }
    }
}

#Preview {
    PracticeView()
}
