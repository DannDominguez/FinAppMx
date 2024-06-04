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

struct SimpleButton: View {
    var buttonName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            //Add action
        }
            Text(buttonName)
            .font(.headline)
            .fontDesign(.default)
            .font(.system(size: 100))
            .foregroundColor(.navyBlue)
            .frame(width: 200, alignment: .init(horizontal: .center, vertical: .center))
            .padding(.all)
            .background(Color.green)
            .cornerRadius(6)
            .clipShape(.capsule)
            .multilineTextAlignment(.center)
            .overlay(
                Capsule()
                    .stroke(Color.white, lineWidth: 2))
        }
        
    }


