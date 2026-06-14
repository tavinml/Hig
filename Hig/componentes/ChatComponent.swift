//
//  chatComponent.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI

struct ChatComponent: View {
    
    let challenge: Challenge
    let challengeState: ChallengeState
    let currntIndex: Int
    let total: Int
    let onRetry: () -> Void
    let onNext: () -> Void
    
    private var chatImage: NSImage? {
        switch challengeState {
        case .initial:
            return challenge.imageChat.indices
                .contains(0) ? challenge
                .imageChat[0] : nil
        case .wrong:
            return challenge.imageChat.indices
                .contains(0) ? challenge
                .imageChat[0] : nil
        case .correct:
            return challenge.imageChat.indices
                .contains(1) ? challenge
                .imageChat[1] : nil
        }
        
        
    }
    
    private var changeText: String {
        switch challengeState {
        case .initial:
            return challenge.descriptionChallenge
        case .wrong:
            return challenge.wrongFeedback
        case .correct:
            return challenge.correctFeedback
        }
    }
    
    private var changeColorBaloon: Color {
        switch challengeState {
        case .initial:
            return .white
        case .wrong:
            return .white
        case .correct:
            return .colorLayout
        }
    }

    var body: some View {
        VStack(alignment: .center){
            Text(challenge.titleChat) //Titulo
                .font(.largeTitle)
                .bold()
            
            HStack(alignment: .top) {
                
                if let image =  chatImage {
                    Image(
                        nsImage: image
                    ) //Imagem do mascote que ficara do lado dos baloes
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 150, maxHeight: 150)
                    .padding(.horizontal, 20)
                }
                
                Text(changeText)
                    .font(.title2)
                    .background(changeColorBaloon)
            }
        }
        VStack{
            Spacer()
            ProgressBar(current: currntIndex + 1,
                        total: total,
                        challengeState: challengeState,
                        onNext: onNext,
                        onRetry: onRetry)
            .padding(.bottom, 40)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .ignoresSafeArea()
        .frame(maxWidth: . infinity)
        .frame(maxHeight: .infinity, alignment: .topTrailing)
            
        .background(Color.backgroundChat)
    }
}

//#Preview {
//    ChatComponent(challenge: Challenge(),
//                  challengeState: .initial,
//                  currntIndex: 0,
//                  total: 4)
//}
