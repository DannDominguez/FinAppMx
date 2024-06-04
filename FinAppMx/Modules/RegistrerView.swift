//
//  RegistrerView.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 30/05/24.
//

import SwiftUI

struct RegistrerView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.navyBlue
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack{
                        StaticSplashView()
                            .padding(.top, -200)
                    }
                    
                    
                    VStack{
                        Text("Crea tu cuenta y transforma tus finanzas. ")
                            .font(.headline)
                            .fontDesign(.default)
                            .font(.system(size: 100))
                            .foregroundStyle(.white)
                            
                    }.padding(.top, -300)
                    
                    
                    
                    HStack {
                        NavigationLink(destination: RegistrerView()) {
                            Text("**Registrarse con E-mail**")
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
                    }.padding(.top, -200)
                    
                    
                }
            }
        }
    }
}

#Preview {
    RegistrerView()
}
