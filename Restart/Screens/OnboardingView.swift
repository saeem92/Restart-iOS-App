//
//  OnboardingView.swift
//  Restart
//
//  Created by saeem  on 16/02/22.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // App storage property wrapper is used to store edit and recall its value using the device permanent storage.
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing:20) {
               // Mark: - HEADER
                
                Spacer()
                
                VStack(spacing:0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
It's not how much we give but
how much love we put into giving.
""")
                    /// " " " tripple quotes helps us in writing multiline Texts.
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }// HEADER
                
                //Mark: - CENTER
                
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    }// Zstack
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }// Center
                
                Spacer() // This spacer pushes up the header.
                
                // MARK: - FOOTER
                
                ZStack{
                    // PARTS OF THE CUSTOM BUTTON
                    
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)// This pushed our text a little to the right
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        
            Spacer() // This is pushing our button to the a starting point.
                        
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
                    // capsule shape will change its width when users are dragging the button
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                        
                        Spacer() // The spacer here pushed the button to the left edge and this button covers the capsule shaped beneath
                        
                    }//: Hstack
                    
                    
                }//:Footer
                .frame(height: 80, alignment: .center)
                .padding()
                // .frame here is a modifier to the container to navigate the cursor to the end of the z
            }//: Vstack
        }//: Zstack
    }
}
// Vstack is a verticla stack container this will allow us to add more views after each other.

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
