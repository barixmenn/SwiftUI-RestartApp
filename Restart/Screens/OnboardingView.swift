//
//  OnboardingView.swift
//  Restart
//
//  Created by macbook on 24.06.2022.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage ("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat = 0
    @State private var isAnimating : Bool = false
    @State private var imgOffset : CGSize = .zero
    

    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
        VStack(spacing: 20) {
            //MARK: -Header
             Spacer()
            
            VStack(spacing: 0){
                Text("Share")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("""
                 It's not how much we give but
                 how much love we put into givining.
                """)
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                
            } //: Header
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
            .animation(.easeOut(duration: 1), value: isAnimating)
            
            //MARK: - Center
            ZStack{
                GroupCircleView(shapeColor: .white, circleOpacity: 0.2)
                    .offset(x: imgOffset.width * -1)
                    .blur(radius: abs(imgOffset.width / 5))
                    .animation(.easeOut(duration: 1), value: isAnimating)
                
                Image("character-1")
                    .resizable()
                    .scaledToFit()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
                    .offset(x: imgOffset.width * 1.2, y: 0)
                    .rotationEffect(.degrees(Double(imgOffset.width / 30)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if abs(imgOffset.width) <= 150 {
                                    imgOffset = gesture.translation
                                }
                            }
                            .onEnded{_ in
                                imgOffset = .zero
                                
                            }
                    )
                    .animation(.easeOut(duration: 1), value: isAnimating)
                    
            } //: Center
            Spacer()
            
            //MARK: -Footer
            
            ZStack{
                //Pars of the custom  button
                
                //1. BACKGROUND (Static)
                
                Capsule()
                    .fill(.white.opacity(0.2))
                Capsule()
                    .fill(.white.opacity(0.2))
                    .padding(8)
                
                //2. CALL-TO-ACTION (Static)
                Text("Get Started")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                //3. CAPSULE (Dynamic)
                HStack{
                    Capsule()
                        .fill(Color("ColorRed"))
                        .frame(width: buttonOffset + 80)
                        Spacer()
                }
                //4. CIRCLE (Draggable)
                HStack {
                    ZStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                        Capsule()
                            .fill(.black.opacity(0.15))
                            .padding(8)
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 24,weight: .bold))
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                    .gesture(
                    DragGesture()
                        .onChanged{ gesture in
                            if gesture.translation.width > 0 && buttonOffset	 <= buttonWidth - 80{
                                buttonOffset = gesture.translation.width
                            }
                        }
                    
                        .onEnded{ _ in
                            withAnimation(Animation.easeOut(duration: 0.4)) {
                                if buttonOffset > buttonWidth / 2 {
                                    playSound(sound: "chimeup", type: "mp3")
                                    buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = false
                                } else {
                                    buttonOffset = 0
                                }
                            }
                        }
                    ) //:GESTURE
                    
                    Spacer()
                }//: HStack

            } //: Footer
            .frame(width: buttonWidth, height: 80,alignment: .center)
            .padding()
            .opacity(isAnimating ? 1: 0)
            .offset(y: isAnimating ? 0 : 40)
            .animation(.easeOut(duration: 1), value: isAnimating)
          
            	
        } //: VStack
        } //: ZStack
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
