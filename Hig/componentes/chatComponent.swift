//
//  chatComponent.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI

struct chatComponent: View {
    
    var challengeState: ChallengeState
    var onNext: () -> Void
    var onRetry: () -> Void

        var body: some View {
                HStack(alignment: .top) {
                    Image("imageChat")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 150, maxHeight: 150)
                        .padding(.horizontal, 20)
                    VStack(alignment: .trailing) {
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .frame(width: 55, height: 40)

                            Text("Parabéns! Você acertou.")
                                .foregroundColor(.black)
                                .font(.title2)
                                .frame(maxWidth: 330, maxHeight: 70, alignment: .leading)
                                .padding(.horizontal, 20)
                                .background(.colorLayout)
                                .cornerRadius(38)
                            
                        }
                        .foregroundColor(.colorLayout)
                        .padding(.vertical, 20)
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .frame(width: 55, height: 50)
                            Text("Ainda não é esse o elemento. Procure por algo que deveria chamar mais atenção, mas não está sendo destacado corretamente.")
                                .foregroundColor(.black)
                                .font(.title2)
                                .frame(maxWidth: 440, minHeight: 76, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(.white)
                                .cornerRadius(38)
                            
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .frame(maxWidth: . infinity)
                .frame(maxHeight: .infinity, alignment: .topTrailing)
                .background(Color.red.opacity(0.1))
            
        }
}

//#Preview {
//    chatComponent(challengeState: ChallengeState.initial)
//}
