//
//  PracticeView.swift
//  hig_testes
//
//  Created by Ana Soares on 05/06/26.
//

import SwiftUI
import Nuvem

struct PracticeView: View {
    
    let lesson: Lessons.Observable
    @Environment(AppModel.self) var model
    
    @State var currentChallengeIndex = 0
    @State private var challengeState: ChallengeState = .initial
    @State private var selectedArea: Int? = nil
    @State private var foundCorrects: [Int] = []
    @State private var completedChallenges: [Int] = []
    @State private var wrongAttemptCount: Int = 0
    
    @State var finished: Bool = false
    @State var isOverlay: Bool = false
//    @State var isNextChallenge: Bool = false
    
    
    var numberChallenges: Int {
        return lesson.challenges.count
    }
    private var challenges: [Challenge] {
        lesson.challenges
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            let numChallenges = numberChallenges
            if currentChallengeIndex < numChallenges{
                HStack {
                    
                    MocapComponent(challenge: challenges[currentChallengeIndex],
                                   challengeState: challengeState,
                                   selectedArea: selectedArea,
                                   correctsIndex: foundCorrects,
                                   onSelected: handleSelected,
                                   finished: $finished)
                    .id(currentChallengeIndex)
                    .frame(width: geometry.size.width * 0.6)
                    
                    ChatComponent(challenge: challenges[currentChallengeIndex],
                                  challengeState: challengeState,
                                  completedChallenges: completedChallenges.count,
                                  currntIndex: currentChallengeIndex,
                                  total: challenges.count,
                                  onRetry: handleRetry,
                                  onNext: handleNext,
                                  windowWidth: geometry.size.width,
                                  wrongAttemptCount: wrongAttemptCount,
                                  finished: $finished,
                                  isOverlay: $isOverlay)
                    .frame(width: geometry.size.width * 0.4)
                    
                }
                .blur(radius: isOverlay ? 5 : 0)
                .overlay(loadingOverlay, alignment: .center)
            }
        }
    }
    
//    private func nextChallenge() {
//        currentChallengeIndex += 1
//        isNextChallenge.toggle()
//    }
    
    private func handleSelected(_ areaId: Int){
        selectedArea = areaId
        let correctIndex = challenges[currentChallengeIndex].correctSection
        if areaId == correctIndex {
            challengeState = .correct
            if completedChallenges.count == challenges.count  {
                finished = true
            }
        } else {
            wrongAttemptCount += 1
            challengeState = .wrong
        }
    }
    
    private func handleRetry(){
        selectedArea = nil
        challengeState = .attempt
        
//        if wrongAttemptCount >= 0 {
//            challengeState = .wrong
//            
//        } else {
//            challengeState = .attempt
//        }
        
//        challengeState = .initial
    }
    
    private func handleNext(){
        foundCorrects.append(challenges[currentChallengeIndex].correctSection)
        completedChallenges.append(currentChallengeIndex)
        
        let next = currentChallengeIndex + 1
        if next < challenges.count {
            currentChallengeIndex = next
            selectedArea = nil
            challengeState = .initial
            
        } else {
            finished = true
        }
    }
    @ViewBuilder private var loadingOverlay: some View {
        if isOverlay {
            PopupFinished()
        }
    }
}

//#Preview {
//    PracticeView(
//        lesson: <#Lessons.Observable#>)
//}
