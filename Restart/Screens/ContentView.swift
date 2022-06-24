//
//  ContentView.swift
//  Restart
//
//  Created by macbook on 24.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    //Depolamada bir yer tutmaya yarar
    @AppStorage ("onboarding") var isOnboardingViewActive: Bool = true
    
    
    var body: some View {
       
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
