//
//  MainScreenView.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 30/05/24.
//

import SwiftUI

struct MainScreenView: View {
    @State private var showSplashScreen = true
    @State private var stopSplashAnimation = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.navyBlue
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    if showSplashScreen {
                        SplashScreenView()
                            .frame(width: 200, height: 200)
                            .offset(y: stopSplashAnimation ? 0 : 1)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        stopSplashAnimation = true
                                    }
                                }
                            }
                        
                    }
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: RegistrerView()) {
                            Text("**Registrarse**")
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
                    }.padding(.bottom, -100)
                    
                    HStack {
                        NavigationLink(destination: LoginView()) {
                            Text("Ya tengo una cuenta")
                                .font(.headline)
                                .fontDesign(.default)
                                .font(.system(size: 100))
                                .foregroundStyle(.white)
                                .padding(.top, 100)
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
            
                }
            }
        }
   
    #Preview {
        MainScreenView()
    }
