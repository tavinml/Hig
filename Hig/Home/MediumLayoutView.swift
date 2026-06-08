//
//  MediumLayoutView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI

struct MediumLayoutView: View {
    var body: some View {
        NavigationStack {
                VStack(alignment: .leading) {
                    GeometryReader { geo in
                        ScrollView(.vertical) {
                            ViewThatFits {
                                if geo.size.width <= 1140 {
                                    VStack(alignment: .leading) {
                                        Text("Layout e Tipografia")
                                            .font(.largeTitle)
                                            .bold()
                                            .padding(.leading, 15)
                                        HStack {
                                            card()
                                                .frame(maxWidth: 382)
                                                .frame(maxHeight: 233)
                                                .padding(15)
                                            card()
                                                .frame(maxWidth: 382)
                                                .frame(maxHeight: 233)
                                                .padding(15)
                                        }
                                        card()
                                            .frame(maxWidth: 382)
                                            .frame(maxHeight: 233)
                                            .padding(15)
                                        
                                        Text("Cores")
                                            .font(.largeTitle)
                                            .bold()
                                            .padding(.leading, 15)
                                        HStack {
                                            card()
                                                .frame(maxWidth: 382)
                                                .frame(maxHeight: 233)
                                                .padding(15)
                                            card()
                                                .frame(maxWidth: 382)
                                                .frame(maxHeight: 233)
                                                .padding(15)
                                        }
                                        Text("Materiais")
                                            .font(.largeTitle)
                                            .bold()
                                            .padding(.leading, 15)
                                        HStack {
                                            card()
                                                .frame(maxWidth: 382)
                                                .frame(maxHeight: 233)
                                                .padding(15)
                                            card()
                                                .frame(maxWidth: 382)
                                                .frame(maxHeight: 233)
                                                .padding(15)
                                        }
                                    }
                                    .padding(.leading, 15)
                                }
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    MediumLayoutView()
}
