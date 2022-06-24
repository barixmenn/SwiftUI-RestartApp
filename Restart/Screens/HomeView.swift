//
//  HomeView.swift
//  Restart
//
//  Created by macbook on 24.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage ("onboarding") var isOnboardingViewActive: Bool = true
    @State private var isAnimating : Bool = false

    var body: some View {
        
        VStack(spacing: 20) {
            
            //MARK: -HEADER
            Spacer()
            ZStack {
                GroupCircleView(shapeColor: .gray, circleOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 30 : -30)
                .animation(Animation
                    .easeOut(duration: 3)
                    .repeatForever()
                    ,value: isAnimating)
                
            }
            
            
            //MARK: -CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .padding()
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            //MARK: -FOOTER
            Spacer()
            
            Button {
                playSound(sound: "success", type: "mp4a")
                isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            

            

          
            } //: VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              isAnimating = true
            }
        }
}
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
