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
    let completedChallenges: Int
    let currntIndex: Int
    let total: Int
    let onRetry: () -> Void
    let onNext: () -> Void
    let windowWidth: CGFloat
    let wrongAttemptCount: Int

    
   @Binding var finished: Bool
    @Binding var isOverlay: Bool
    
    
    
    // Faz a mudança do chatImage de acordo com o estado
    private var chatImage: NSImage? {
        switch challengeState {
        case .initial:
            return challenge.imageChat.indices
                .contains(2) ? challenge
                .imageChat[2] : nil
        case .wrong:
                return challenge.imageChat.indices
                    .contains(0) ? challenge
                    .imageChat[0] : nil
        case .correct:
            return challenge.imageChat.indices
                .contains(1) ? challenge
                .imageChat[1] : nil
        case .attempt:
            return challenge.imageChat.indices
                .contains(3) ? challenge
                .imageChat[3] : nil
        }
        
        
    }
    
    //Balao roxo
    private func titleChange(text: String, icon: String?) -> some View {
        HStack(spacing: 6) {
            if let icon {
                Image(systemName: icon)
                    .foregroundStyle(challengeState == .wrong ? Color.red : Color.green)
            }
            
            Text(text)
                .font(.body.bold())
                .foregroundColor(.black)
            
        }
        .frame(maxWidth: 440, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(.colorLayout)
        .cornerRadius(24)
        
    }
    //Balao branco
    private func change(_ text: String) -> some View {
        
        
        Text(text)
            .font(.body)
            .foregroundStyle(.black)
            .frame(maxWidth: 440, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(.white)
            .cornerRadius(24)
    }

    var body: some View {
        VStack(alignment: .center){
            Spacer(minLength: 5)
            VStack(alignment: .center, spacing: windowWidth > 1200 ? 50 : 30){
                Text(challenge.titleChat) //Titulo
                    .font(windowWidth > 1200 ? .largeTitle : .title)
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
                    
                    VStack(alignment: .trailing, spacing: 24){
                        switch challengeState {
                            //Passo os valores de acordo com o array do CloudKit
                        case .initial:
                            
                            ChatBaloonTitle(text: challenge.titleChallenge, icon: nil, iconColor: .clear, windowWidth: windowWidth)
                            
                            ForEach(challenge.descriptionChallenge, id: \.self){ description in
                                
                                //nem todos vao ter um segundo balao, faço isso pra quando ele ta diferente de vazio
                                if !challenge.descriptionChallenge.isEmpty {
                                    ChatBaloon(text: description, windowWidth: windowWidth)
                                }
                            }
                            
                            //
                        case .wrong:
                            
//                            if wrongAttemptCount <= 1{
//                                ChatBaloonTitle(text: challenge.wrongFeedback.wrongAttemptTitle,
//                                                icon: nil,
//                                                iconColor: .clear,
//                                                windowWidth: windowWidth)
//                                
//                                ChatBaloon(text: challenge.wrongFeedback.wrongAttemptFirst, windowWidth: windowWidth)
//                                
//                                if !challenge.wrongFeedback.wrongAttemptSecond.isEmpty {
//                                    ChatBaloon(text: challenge.wrongFeedback.wrongAttemptSecond, windowWidth: windowWidth)
//                                }
//                                
//                            }
//                            else {
//                                ChatBaloonTitle(text: challenge.wrongFeedback.wrongTitle,
//                                                icon: "xmark.circle.fill",
//                                                iconColor: .red,
//                                                windowWidth: windowWidth)
//                                
//                                ChatBaloon(text: challenge.wrongFeedback.wrongFirst, windowWidth: windowWidth)
//                                
//                                if !challenge.wrongFeedback.wrongSecond.isEmpty {
//                                    ChatBaloon(text: challenge.wrongFeedback.wrongSecond, windowWidth: windowWidth)
//                                }
//                            }
                            
                            ChatBaloonTitle(text: challenge.wrongFeedback.wrongTitle,
                                            icon: "xmark.circle.fill",
                                            iconColor: .red,
                                            windowWidth: windowWidth)
                            
                            ChatBaloon(text: challenge.wrongFeedback.wrongFirst, windowWidth: windowWidth)
                            
                            if !challenge.wrongFeedback.wrongSecond.isEmpty {
                                ChatBaloon(text: challenge.wrongFeedback.wrongSecond, windowWidth: windowWidth)
                            }
                        case .correct:
                            ChatBaloonTitle(text: challenge.correctFeedback.correctTitle, icon: "checkmark.circle.fill", iconColor: .green,windowWidth: windowWidth)
                            
                            ChatBaloon(text: challenge.correctFeedback.correctFirst, windowWidth: windowWidth)
                            
                            if !challenge.correctFeedback.correctSecond.isEmpty {
                                ChatBaloon(text: challenge.correctFeedback.correctSecond, windowWidth: windowWidth)
                            }
                            
                        case .attempt:
                            ChatBaloonTitle(text: challenge.wrongFeedback.wrongAttemptTitle,
                                            icon: nil,
                                            iconColor: .clear,
                                            windowWidth: windowWidth)
                            
                            ChatBaloon(text: challenge.wrongFeedback.wrongAttemptFirst, windowWidth: windowWidth)
                            
                            if !challenge.wrongFeedback.wrongAttemptSecond.isEmpty {
                                ChatBaloon(text: challenge.wrongFeedback.wrongAttemptSecond, windowWidth: windowWidth)
                            }
                    
                        }
                    }
                }
                Spacer()
                ProgressBar(current: currntIndex + 1,
                            total: total,
                            completed: completedChallenges,
                            challengeState: challengeState,
                            onNext: onNext,
                            onRetry: onRetry,
                            windowWidth: windowWidth,
                            isOverlay: $isOverlay,
                            finished: $finished)
                .padding(.bottom, 40)
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .ignoresSafeArea()
            .frame(maxWidth: . infinity)
            .frame(maxHeight: .infinity, alignment: .topTrailing)
        }
           
            
            .background(Color.backgroundChat)
//        }
    }
}

//#Preview {
//    ChatComponent(challenge: Challenge(), challengeState: .initial, currntIndex: 4, total: 5, onRetry: {}, onNext: {}, finished: .constant(false))
//}
