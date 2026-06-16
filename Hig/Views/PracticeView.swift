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
    
    @State private var currentChallengeIndex = 0
    @State private var challengeState: ChallengeState = .initial
    @State private var selectedArea: Int? = nil
    @State private var foundCorrects: [Int] = []
    @State private var completedChallenges: [Int] = []
    @State var finished: Bool = false
    
    private var challenges: [Challenge] {
        lesson.challenges
    }
    
    var body: some View {
        
        //add as views
        Group {
            if challenges.isEmpty {
                ProgressView("carregando desafios")
//            } else if finished {
//                VStack{
//                    Text("parabens")
//                }
            } else {
                GeometryReader { geometry in
                    HStack {
                        //p
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
                                      finished: $finished)
                        .frame(width: geometry.size.width * 0.4)
                    }
                }
            }
        }

//        GeometryReader { geometry in
//            HStack {
//                MocapComponent()
//                    .frame(width: geometry.size.width * 0.6)
//                ChatComponent()
//                    .frame(width: geometry.size.width * 0.4)
//            }
//        }
    }
    
    private func handleSelected(_ areaId: Int){
        selectedArea = areaId
        let correctIndex = challenges[currentChallengeIndex].correctSection
        challengeState = (areaId == correctIndex) ? .correct : .wrong
    }
    
    private func handleRetry(){
        selectedArea = nil
        challengeState = .initial
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
}

//#Preview {
//    PracticeView(
//        lesson: <#Lessons.Observable#>)
//}
