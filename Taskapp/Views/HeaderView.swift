//
//  HeaderView.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        VStack{
            
            Image("screen")
//            RoundedRectangle(cornerRadius: 0 )
//                .foregroundColor(background)
//                .rotationEffect(Angle(degrees: angle))
            
            
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .foregroundColor(.white)

            }
            .padding(.top, 80)

        }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)

            }
}

#Preview {
    HeaderView(title: "Teste",
               subtitle: "testesubtitulo",
               angle: 15.0,
               background: .purple)
}
