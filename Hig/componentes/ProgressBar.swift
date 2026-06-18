//
//  ProgressBar.swift
//  Hig
//
//  Created by Bernardo on 12/06/26.
//

import SwiftUI

struct ProgressBar: View {
    
    var current: Int
    var total: Int
    let completed: Int
    var challengeState: ChallengeState
    var onNext: () -> Void = {}
    var onRetry: () -> Void = {}
    let windowWidth: CGFloat
    
    @Binding var isOverlay: Bool
    @Binding var finished: Bool

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                Text("Desafio \(current)/\(total)") // contador dos desafios concluidos
                .font(windowWidth > 1400 ? .largeTitle.bold() : .title.bold())
                .foregroundColor(.componetesProgressBar)
            
            // usado para calcular o valor da barra de progresso de acordo com a quantidade toal de desafios
            GeometryReader { geometry in
                let progressPercentage = CGFloat(completed) / CGFloat(total)
                let calculatedWidth = geometry.size.width * progressPercentage
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width)
                        .frame(height: 24)
                    Capsule()
                        .foregroundColor(.colorLayout)
                        .frame(width: calculatedWidth, height: 24)
                }
                .frame(height: windowWidth > 1400 ? 24 : 16)
            }
            .frame(height: windowWidth > 1400 ? 24 : 16)
            
            switch challengeState {
            case .initial:
                EmptyView()
            case .wrong:
                Button(action: onRetry){
                    HStack(alignment: .center) {
                        Image(systemName: "arrow.clockwise")
                            .font(windowWidth > 1400 ? .title.bold() : .title2.bold())
                        Text("Refazer")
                            .font(windowWidth > 1400 ? .title.bold() : .title2.bold())
                    
                    
                    }
                    .padding(.horizontal, windowWidth > 1400 ? 30 : 20)
                    .padding(.vertical, windowWidth > 1400 ? 10 : 8)
                    .background(Color.colorSlider)
                    .foregroundStyle(Color.black)
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
                
            case .correct:
                
                if finished {
                    NavigationStack {
                        Button(action: {
                            isOverlay.toggle()
                        }, label: {
                            HStack(alignment: .center) {
                                Image(systemName: "play.fill")
                                    .font(windowWidth > 1400 ? .title.bold() : .title2.bold())
                                Text("CONCLUIR LIÇÃO")
                                    .font(windowWidth > 1400 ? .title.bold() : .title2.bold())
                            }
                            .padding(.horizontal, windowWidth > 1400 ? 30 : 20)
                            .padding(.vertical, windowWidth > 1400 ? 10 : 8)
                            .background(Color.colorSlider)
                            .foregroundStyle(Color.black)
                            .clipShape(Capsule())
                        })
                        .buttonStyle(.borderless)

                    }
                    
                } else {
                    Button(action: onNext) {
                        HStack(alignment: .center) {
                            Image(systemName: "play.fill")
                                .font(windowWidth > 1400 ? .title.bold() : .title2.bold())
                            Text("Próximo")
                                .font(windowWidth > 1290 ? .title.bold() : .title2.bold())
                        }
                        .padding(.horizontal, windowWidth > 1400 ? 30 : 20)
                        .padding(.vertical, windowWidth > 1400 ? 10 : 8)
                        .background(Color.colorSlider)
                        .foregroundStyle(Color.black)
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
                
            }

        }
        .padding(24)
        .background(Color.backgroundProgressBar)
        .cornerRadius(26)
        
    }
    
    @ViewBuilder private var loadingOverlay: some View {
        if isOverlay {
            PopupFinished()
        }
    }
}
//#Preview {
//    VStack {
//        ProgressBar(current: 1,
//                    total: 3,
//                    challengeState: .initial,
//                    finished: .constant(false))
//        ProgressBar(current: 2,
//                    total: 3,
//                    challengeState: .initial,
//                    finished: .constant(false))
//        ProgressBar(current: 3,
//                    total: 3,
//                    challengeState: .initial,
//                    finished: .constant(true))
//    }
//    .padding()
//}
