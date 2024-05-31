//
//  SplashScreenView.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 30/05/24.
//

//import SwiftUI
//
//struct SplashScreenView: View {
//    @State private var lineProgress: CGFloat = 0.0
//
//    var body: some View {
//        VStack {
//
//            ExponentialLine(progress: lineProgress)
//                .stroke(Color.green, lineWidth: 3)
//                .frame(width: 200, height: 100)
//                .padding()
//                .onAppear {
//                    withAnimation(.easeInOut(duration: 2.0)) {
//                        lineProgress = 1.0
//                    }
//                }
//            Text("FinAppMx")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//
//
//        }
//        .background(Color.navyBlue)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ExponentialLine: Shape {
//    var progress: CGFloat
//
//    var animatableData: CGFloat {
//        get { progress }
//        set { progress = newValue }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let height = rect.height
//        let width = rect.width
//
//        path.move(to: CGPoint(x: 0, y: height))
//        for x in stride(from: 0, to: width * progress, by: 1) {
//            let y = height * exp(-3 * (x / width)) // Exponential decay for visual representation
//            path.addLine(to: CGPoint(x: x, y: height - y))
//        }
//
//        return path
//    }
//}
//
//extension Color {
//    static let navyBlue = Color(red: 0.0, green: 0.0, blue: 0.5)
//}



import SwiftUI

struct SplashScreenView: View {
    @State private var lineProgress: CGFloat = 0.0
    @State private var displayedText: String = ""
    private let fullText = "FinAppMx"
    
    var body: some View {
        ZStack {
            Color.navyBlue
                .edgesIgnoringSafeArea(.all)
            VStack {
                MovingLine(progress: lineProgress)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: 200, height: 100)
                    .padding()
                    .onAppear {
                        withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                            lineProgress = 1.0
                        }
                    }
                Text(displayedText)
                    .font(.largeTitle)
                    .fontDesign(.default)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .onAppear {
                        typeText()
                    }
            }
            
        }
    }
    
    private func typeText() {
        var delay = 0.0
        for char in fullText {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                displayedText.append(char)
            }
            delay += 0.2
        }
    }
    
}

struct MovingLine: Shape {
    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        let width = rect.width
        
        path.move(to: CGPoint(x: 0, y: height / 2))
        for x in stride(from: 0, to: width * progress, by: 1) {
            let normalizedX = x /  width
            let y = height / 2 + (height / 4) * (sin(normalizedX * 3 * .pi * 1) + cos(normalizedX * 3 * .pi * 3))
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}






#Preview {
    SplashScreenView()
}
