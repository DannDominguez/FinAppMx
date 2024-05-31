//
//  AppStyles.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 30/05/24.
//

import SwiftUI

//MARK: Colores personalizados
extension Color {
    static let navyBlue = Color(red: 0.0, green: 0.0, blue: 0.4)
}

//MARK: Botones
struct NextButton: View {
   
    var buttonName: String
    
    var body: some View {
        Button {
            //Add action
        } label: {
            Image(systemName: "arrow.forward")
                .foregroundStyle(.white)
            Text(buttonName)
                .font(.system(.subheadline))
                .padding()
               
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        
    }
}

struct SimpleButton: View {
    var buttonName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            //Add action
        }
            Text(buttonName)
                .font(.system(.subheadline))
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        
    }


