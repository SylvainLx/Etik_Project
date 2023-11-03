//
//  SplashScreenView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 03/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive{
            LandingView()
        } else {
            VStack {
                VStack{
                    Image("icone")
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                    
                    
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
