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
    
   @Binding var finished: Bool
    
    
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
        }
        
        
    }
    
    //Balao roxo
    private func titleChange(text: String, icon: String?) -> some View {
        HStack(spacing: 6) {
            if let icon {
                Image(systemName: icon)
                    .foregroundStyle(challengeState == .wrong ? Color.red : Color.green)
            }
            
            ZStack(alignment: .bottomLeading){
                Rectangle()
                    .fill(Color.colorLayout)
                    .frame(width: 30, height: 20)
                
                Text(text)
                    .font(.body.bold())
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(.colorLayout)
                    .cornerRadius(24)
            }
            
        }
        .frame(maxWidth: 440, alignment: .leading)
        
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
            .cornerRadius(38)
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
                
                VStack(alignment: .trailing, spacing: 8){
                    switch challengeState {
                        //Passo os valores de acordo com o array do CloudKit
                    case .initial:
                        
                        
                        titleChange(text: challenge.titleChallenge,
                                    icon: nil)
                        ForEach(challenge.descriptionChallenge, id: \.self){ description in
                            
                            //nem todos vao ter um segundo balao, faço isso pra quando ele ta diferente de vazio
                            if !challenge.descriptionChallenge.isEmpty {
                                change(description)
                            }
                        }
                        
//                        
                    case .wrong:
                        titleChange(text: challenge.wrongFeedback.wrongTitle,
                                    icon: "xmark.circle.fill")
                        
                        change(challenge.wrongFeedback.wrongFirst)
                        
                        if !challenge.wrongFeedback.wrongSecond.isEmpty {
                            change(challenge.wrongFeedback.wrongSecond)
                        }
                    case .correct:
                        titleChange(text: challenge.correctFeedback.correctTitle,
                                    icon: "checkmark.circle.fill")
                        
                        change(challenge.correctFeedback.correctFirst)
                        
                        if !challenge.correctFeedback.correctSecond.isEmpty {
                            change(challenge.correctFeedback.correctSecond)
                        }

                    }
                }
                
    
                
//                Text(changeText)
//                    .font(.title2)
//                    .background(changeColorBaloon)
//                    .frame(maxWidth: 440, alignment: .leading)
            }
            Spacer()
            ProgressBar(current: currntIndex + 1,
                        total: total,
                        challengeState: challengeState,
                        onNext: onNext,
                        onRetry: onRetry,
                        finished: $finished)
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

#Preview {
    ChatComponent(challenge: Challenge(), challengeState: .initial, currntIndex: 4, total: 5, onRetry: {}, onNext: {}, finished: .constant(false))
}
