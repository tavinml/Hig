//
//   VStackLayoutView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI

struct VStackLayoutView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Layout e Tipografia")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                    
                    Text("Cores")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                    
                    Text("Materiais")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 15)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                    card()
                        .frame(maxWidth: 382)
                        .frame(maxHeight: 233)
                        .padding(10)
                }
                .padding(.leading, 15)
            }
        }
    }
}

#Preview {
    VStackLayoutView()
}
