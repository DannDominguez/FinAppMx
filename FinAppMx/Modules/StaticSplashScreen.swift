//
//  StaticSplashScreen.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 31/05/24.
//

import SwiftUI

struct StaticSplashView: View {
    private let fullText = "FinAppMx"
    @State private var displayedText = ""

    var body: some View {
        ZStack {
            Color.navyBlue
                .edgesIgnoringSafeArea(.all)
            VStack {
                StaticLine()
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: 200, height: 100)
                    .padding()
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

struct StaticLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        let width = rect.width

        path.move(to: CGPoint(x: 0, y: height / 2))
        for x in stride(from: 0, to: width, by: 1) {
            let normalizedX = x /  width
            let y = height / 2 + (height / 4) * (sin(normalizedX * 3 * .pi * 1) + cos(normalizedX * 3 * .pi * 3))
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}


#Preview {
    StaticSplashView()
}
