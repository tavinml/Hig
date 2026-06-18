//
//  ProgressBar.swift
//  Hig
//
//  Created by Bernardo on 12/06/26.
//

import SwiftUI

struct ProgressBar: View {
    
    // tirei os @State por que so irei conseguir mudar esses valores na view e nao ia conseguir receber de fora
//    var total: Int = 3
//    var slide: Int = 1
//    var Next: Bool? = true
    
    var current: Int
    var total: Int
    let completed: Int
    var challengeState: ChallengeState
    var onNext: () -> Void = {}
    var onRetry: () -> Void = {}
    
    @Binding var finished: Bool

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                Text("Desafio \(current)/\(total)") // contador dos desafios concluidos
                .font(.largeTitle.bold())
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
                .frame(height: 24)
            }
            .frame(height: 24)
            
            switch challengeState {
            case .initial:
                EmptyView()
            case .wrong:
                Button(action: onRetry){
                    HStack(alignment: .center) {
                        Image(systemName: "arrow.clockwise")
                            .font(Font.title.bold())
                        Text("Refazer")
                            .font(Font.title.bold())
                    
                    
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color.colorSlider)
                    .foregroundStyle(Color.black)
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
                
            case .correct:
                
                if finished {
                    NavigationStack {
                        NavigationLink(destination: {
                            AllLessonsView()
                        },label:{
                            HStack(alignment: .center) {
                                Image(systemName: "play.fill")
                                    .font(Font.title.bold())
                                Text("Concluir seção")
                                    .font(Font.title.bold())
                            }
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .background(Color.colorSlider)
                            .foregroundStyle(Color.black)
                            .clipShape(Capsule())
//                            .animation(.spring(duration: 1, bounce: 0.9), value: completed)
                                
                        })
                        .buttonStyle(.borderless)
                    }
                    
                } else {
                    Button(action: onNext) {
                        HStack(alignment: .center) {
                            Image(systemName: "play.fill")
                                .font(Font.title.bold())
                            Text("Próximo")
                                .font(Font.title.bold())
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(Color.colorSlider)
                        .foregroundStyle(Color.black)
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
                
            }
            
//            Button (action: {
//                if slide < total { slide += 1}
//                else {
//                    slide += 0
//                }
//                // logica para fazer a mudança do icone de aproximar e voltar
//            }) { if Next == true {
//                HStack(alignment: .center) {
//                    Image(systemName: "play.fill")
//                        .font(Font.title.bold())
//                    Text("Próximo")
//                        .font(Font.title.bold())
//                }
//                .padding(.horizontal, 30)
//                .padding(.vertical, 10)
//                .background(Color.white)
//                .foregroundStyle(Color.black)
//                .clipShape(Capsule())
//            }; if Next == false {
//                HStack(alignment: .center) {
//                    Image(systemName: "arrow.clockwise")
//                        .font(Font.title.bold())
//                    Text("Refazer")
//                        .font(Font.title.bold())
//
//
//                }
//                .padding(.horizontal, 30)
//                .padding(.vertical, 10)
//                .background(Color.white)
//                .foregroundStyle(Color.black)
//                .clipShape(Capsule())
//            } else {
//                EmptyView()
//                }
//            }
//            .buttonStyle(.plain)
        }
        .padding(24)
        .background(Color.backgroundProgressBar)
        .cornerRadius(26)
        
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
