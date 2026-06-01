import SwiftUI

// High-utility reusable component
struct PrimaryButton: View {
    let title: String
    let icon: String?
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon { Image(systemName: icon) }
                Text(title).bold()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    PrimaryButton(title: "Login", icon: "person.crop.circle") {
    }
}


//
//ZStack {
////            RoundedRectangle(cornerRadius: 26)
////                .fill(backgroundColor)
////                .frame(maxWidth: .infinity)
////                .frame(maxHeight: 233)
//            
//            Image("Mascote1")
//                .resizable()
////                        .frame(width: 239, height: 225)
//            //                        .offset(x: 60, y: 4)
//            //            HStack{
//            //                VStack(alignment: .leading, spacing: 2{
//            //
//            //
//            //                }
//            //
//            //            }
//}
//.background(backgroundColor)
//
//}

