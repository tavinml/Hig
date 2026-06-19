//
//  MocapComponent.swift
//  Hig
//

import SwiftUI

struct MocapComponent: View {

    let challenge: Challenge
    let challengeState: ChallengeState
    let selectedArea: Int?
    let correctsIndex: [Int]
    let onSelected: (Int) -> Void
    
    @Binding var finished: Bool
    
    private var ShowFinished: Bool {
        challengeState == .correct && challenge.finishedImage != nil
    }
    
    private var ShowImage: NSImage{
        ShowFinished ? (challenge.finishedImage ?? challenge.imageChallenge) : challenge.imageChallenge
    }
    
    private var showAreas : Areas {
        ShowFinished ? challenge.finishedArea  : challenge.area
    }
   
    var body: some View {
        GeometryReader { geometry in

            // onde a imagem esta dentro
            let imageRect = renderedRect(
                imageSize: ShowImage.size,
                frameSize: geometry.size
            )

            ZStack(alignment: .topLeading) {
                
                Image(nsImage: ShowImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
//                if challengeState == .correct  && challenge.finishedImage != nil{
//                    Image(nsImage: challenge.finishedImage ?? challenge.imageChallenge)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                } else {
//                    Image(nsImage: challenge.imageChallenge)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                }
               

                //Listando as areas e os challengers
                ForEach(Array(showAreas.values.enumerated()), id: \.offset) { index, area in
                    let alreadyFound = correctsIndex.contains(index) //verifica se uma area especifica ja foi encontrada

                    cardDotted(
                        selected: alreadyFound || selectedArea == index,
                        correct:  alreadyFound || index == challenge.correctSection,
                        height:   area.height * imageRect.height,
                        exerciseNumber: "\(index + 1)",
                        onTap: {
                            //aqui ele guarda o estado das areas que ja foram tocadas
                            guard challengeState == .initial else { return }
                            guard !alreadyFound else { return }
                            onSelected(index)
                        }
                    )
                    .frame(width: area.width * imageRect.width)
                    .position(
                        // minX/minY = onde a imagem começa dentro do frame
                        x: imageRect.minX + (area.x + area.width  / 2) * imageRect.width,
                        y: imageRect.minY + (area.y + area.height / 2) * imageRect.height
                    )
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    //respeitar o scale to fit para que os cardDotteds nao fiquem sabendo
    private func renderedRect(imageSize: CGSize, frameSize: CGSize) -> CGRect {
        guard imageSize.width > 0, imageSize.height > 0 else {
            return CGRect(origin: .zero, size: frameSize)
        }

        let imageAspect = imageSize.width / imageSize.height
        let frameAspect = frameSize.width  / frameSize.height

        let renderedWidth:  CGFloat
        let renderedHeight: CGFloat

        if imageAspect > frameAspect {
            //imagem mais larga que o frame → limitada pela largura
            renderedWidth  = frameSize.width
            renderedHeight = frameSize.width / imageAspect
        } else {
            //imagem mais alta que o frame → limitada pela altura
            renderedHeight = frameSize.height
            renderedWidth  = frameSize.height * imageAspect
        }

        // offset = espaço vazio nas bordas
        let offsetX = (frameSize.width  - renderedWidth)  / 2
        let offsetY = (frameSize.height - renderedHeight) / 2

        return CGRect(x: offsetX, y: offsetY,
                      width: renderedWidth, height: renderedHeight)
    }
}

#Preview {
    MocapComponent(
        challenge: Challenge(),
        challengeState: .initial,
        selectedArea: nil,
        correctsIndex: [],
        onSelected: { _ in },
        finished: .constant(false)
    )
}    
