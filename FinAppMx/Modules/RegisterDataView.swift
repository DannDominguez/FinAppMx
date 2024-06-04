//
//  RegisterDataView.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 31/05/24.
//

import SwiftUI

struct RegisterDataView: View {
    private let fullText = "FinAppMx"
    @State private var displayedTextRV: String = ""
    @StateObject var viewModel = LoginViewModel()
    
    @State var PasswordIsVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.navyBlue
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Crea tu cuenta y transforma tus finanzas con ")
                        .font(.system(size: 25))
                        .fontDesign(.default)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    Spacer()
                    VStack{
                        Text(displayedTextRV)
                            .font(.system(size: 30))
                            .fontDesign(.default)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .onAppear {
                                typeTextRDV()
                            }
                    }
                    
                    
                    VStack {
                        Text("Nombre")
                            .foregroundStyle(.white)
                        TextField("", text: $viewModel.name)
                            .foregroundStyle(.white)
                            .keyboardType(.default)
                            .padding()
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.green, lineWidth: 2))
                            .textFieldStyle(.automatic)
                            .autocorrectionDisabled()
                        
                        
                        Text("Email")
                            .foregroundStyle(.white)
                        TextField("", text: $viewModel.email)
                            .foregroundStyle(.white)
                            .padding()
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.green, lineWidth: 2))
                            .textFieldStyle(.automatic)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        
                        Text("Contraseña")
                            .foregroundStyle(.white)
                        ZStack {
                            HStack {
                                if PasswordIsVisible {
                                    TextField("", text: $viewModel.password)
                                        .foregroundStyle(.white)
                                        .padding()
                                        .overlay(
                                            Capsule(style: .continuous)
                                                .stroke(Color.green, lineWidth: 2))
                                        .textFieldStyle(.automatic)
                                        .autocorrectionDisabled()
                                } else {
                                    SecureField("", text: $viewModel.password)
                                        .foregroundStyle(.white)
                                        .padding()
                                        .overlay(
                                            Capsule(style: .continuous)
                                                .stroke(Color.green, lineWidth: 2))
                                        .textFieldStyle(.automatic)
                                        .autocorrectionDisabled()
                                }
                            }
                            
                            HStack {
                                Button(action: {
                                    PasswordIsVisible.toggle()
                                }) {
                                    Image(PasswordIsVisible ? "visible" : "eyelash")
                                    
                                }.padding(.leading, 250)
                                
                            }
                        }
                    }.padding(.top, 150)
                    
                    VStack {
                        Spacer()
                        SimpleButton(buttonName: "Continuar", action: viewModel.register)
                    }.padding(.top, -200)
                    
                    
                }.padding(.all, 25)
                
                
                
            }
        }
        
    }
    private func typeTextRDV() {
        var delay = 0.0
        for char in fullText {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                displayedTextRV.append(char)
            }
            delay += 0.2
        }
    }
    
}

#Preview {
    RegisterDataView()
}
