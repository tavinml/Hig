//
//  Wrong1.swift
//  Hig
//
//  Created by Gustavo Monteiro Lopes on 05/06/26.
//

import SwiftUI

struct MocapComponent: View {
    
    let challenge: Challenge
    let challengeState: ChallengeState
    let selectedArea: Int?
    let correctsIndex: [Int]
    let onSelected: (Int) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Image(nsImage: challenge.imageChallenge)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                
                ForEach(
                    Array(challenge.area.values.enumerated()),
                    id: \.offset
                ) { index, area in
                    
                    let alreadyFound = correctsIndex.contains(index)
                    
                    cardDotted(selected: alreadyFound || selectedArea == index,
                               correct: alreadyFound || index == challenge.correctSection,
                               height: area.height * geometry.size.height,
                               exerciseNumber: "\(index + 1)",
                               onTap: {
                                    guard challengeState == .initial else { return }
                                    guard !alreadyFound else { return }
                                    onSelected(index)
                               }
                    )
                    .frame(width: area.width * geometry.size.width)
                    .position(
                        x: (area.x + area.width / 2) * geometry.size.width,
                        y: (area.y + area.height / 2) * geometry.size.height
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
            //        ZStack {
            //
            //
            //            //            GeometryReader { geometry in
            //            ViewThatFits {
            //                Image("Wrong1")
            //                    .resizable()
            //                    .scaledToFit()
            //
            //                    .frame(width: designWidth, height: designHeight)
            //
            //                    .overlay(
            //                        GeometryReader{ geometry in
            //                            VStack(spacing: 0) {
            //
            //                                Color.clear.frame(height: 52)
            //
            //                                //Ajustar para deixar escalavel
            //
            //                                cardDotted(selected: false, correct: false, height: 52, exerciseNumber: "1")
            //                                    .padding(.vertical, 30)
            //
            //
            //                                cardDotted(selected: true, correct: false, height: 70, exerciseNumber: "2")
            //                                    .padding(.vertical, -10)
            //
            //
            //                                cardDotted(selected: false, correct: false, height: 175, exerciseNumber: "3")
            //                                    .padding(.vertical,25)
            //
            //                                cardDotted(selected: true, correct: false, height: 75, exerciseNumber: "4")
            //                                    .padding(.vertical,-9)
            //
            //                                Spacer()
            //
            //                                cardDotted(selected: true, correct: true, height: 60, exerciseNumber: "5")
            //                                    .padding(.vertical,55)
            //
            //                            }
            //
            //                            .padding(.horizontal, 6)
            //                            .padding(.vertical, 10)
            //                        }
            //                    )
            //                    .padding()
            //            }
            //            //            }
            //            //                        .frame(width: 375, height: 812)
            //
            //        }
            //        .frame(maxWidth: .infinity, maxHeight: .infinity)
            //    }
        }
    }
}

#Preview {
    MocapComponent(challenge: Challenge(),
                   challengeState: .initial,
                   selectedArea: nil,
                   correctsIndex: [],
                   onSelected: { _ in})
}
