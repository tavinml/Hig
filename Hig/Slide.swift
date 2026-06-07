//
//  Slide.swift
//  Hig
//
//  Created by Bernardo on 02/06/26.
//

import SwiftUI

struct Slide: View {
    var body: some View {
        ZStack(alignment: .center){
            
            
            HStack{
                Image("Ticia")
                    .resizable()
                    .scaledToFit()
                VStack{
                    Image("chatBubble")
                        .resizable()
                        .scaledToFit()
                    Image("chatBubble2")
                        .resizable()
                        .scaledToFit()

                }
                    }
                }
            }
        }
#Preview {
    Slide()
}
