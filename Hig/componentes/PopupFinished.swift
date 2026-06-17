//
//  PopupFinished.swift
//  Hig
//
//  Created by Ana Soares on 16/06/26.
//

import SwiftUI

struct PopupFinished: View {
    var body: some View { 
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
                NextLessonButton()
                    
            }
        }
        .frame(maxWidth: 708, maxHeight: 611)
        .background(.backgroundChat)
        .cornerRadius(10)
    }
}

#Preview {
    PopupFinished()
        .frame(width: 500, height: 400
        )
}
