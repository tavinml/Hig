//
//  PracticeView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI

struct PracticeView: View {
    
    let challenge: [ChallengeExample] = [
        ChallengeExample(correctIndex: 3, imageName: "Wrong1"),
        ChallengeExample(correctIndex: 0, imageName: "Wrong1"),
    ]
    
    @State var currentIndex: Int = 0
    @State var foundCorrects: [Int] = []
    @State var challengeState: ChallengeState = .initial
    @State var finished: Bool = false
    
    var body: some View {
        Group{
            if finished {
                Text("Finished")
            } else {
                GeometryReader { geometry in
                    HStack {
                        mocapComponent(correctIndex: challenge[currentIndex].correctIndex,
                                       imageChallenge: challenge[currentIndex].imageName,
                                       correctsIndex: foundCorrects,
                                       challengeState: challengeState,
                                       onSelect: handleSelection)
                        .id(currentIndex)
                        .frame(width: geometry.size.width * 0.6)
                        chatComponent(challengeState: challengeState,
                                      onNext: handleRetry,
                                      onRetry: handleNext)
                        .frame(width: geometry.size.width * 0.4)
                    }
                }
            }
        }
    }
    
    private func handleSelection(_selectedIndex: Int){
        challengeState = _selectedIndex == challenge[currentIndex].correctIndex ? .correct : .wrong
    }
    
    private func handleRetry(){
        challengeState = .initial
    }
    
    private func handleNext(){
        foundCorrects.append(challenge[currentIndex].correctIndex)
        let next = currentIndex + 1
        if next < challenge.count {
            currentIndex = next
            challengeState = .initial
        } else{
            finished = true
        }
    }
    
}

#Preview {
    PracticeView()
}
