//
//  TLButton.swift
//  Taskapp
//
//  Created by Vinicius Wessner on 17/11/23.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
    
        Button{
            //TODO: acao que deve executar
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding(.top)
    }
}

#Preview {
    TLButton(title: "TEste", background: .indigo, action: {
        //action aqui
    })
}
