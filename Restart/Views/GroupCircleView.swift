//
//  GroupCircleView.swift
//  Restart
//
//  Created by macbook on 24.06.2022.
//

import SwiftUI

struct GroupCircleView: View {
    
    @State  var shapeColor: Color
    @State  var circleOpacity : Double
    @State  private var isAnimating : Bool = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(circleOpacity),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(circleOpacity),lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZStack
        .blur(radius: isAnimating ? 0 : 10 )
        .opacity(isAnimating ? 1 :0 )
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear{
            isAnimating = true
        }
        
}

struct GroupCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            GroupCircleView(shapeColor: .white, circleOpacity: 0.2)
        }
    }
}
}
