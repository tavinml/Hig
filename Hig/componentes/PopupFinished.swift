//
//  PopupFinished.swift
//  Hig
//
//  Created by Ana Soares on 16/06/26.
//

import SwiftUI

struct PopupFinished: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            VStack(alignment: .center, spacing: 30){
                Image("popupImage")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 239, maxHeight: 282)
                Text("Lição Finalizada!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                Text("Parabéns! Agora que você domina hierarquia visual, vamos explorar o próximo módulo: alinhamento.")
                    .font(.title)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                
                HStack {
                    LessonButton()
//                    NextLessonButton()
                        
                }
            }
            .frame(maxWidth: 538, maxHeight: 489)
        }
        .frame(maxWidth: 708, maxHeight: 550)
        .background(.backgroundPopUp)
//        .border(Color.black, width: 0.5)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5)/*.shadowPopUp*/,
                radius: 50,
                x: 0,
                y: 0)
    }
}

//#Preview {
//    PopupFinished()
//        .frame(width: 500, height: 400
//        )
//}
