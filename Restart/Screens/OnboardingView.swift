//
//  OnboardingView.swift
//  Restart
//
//  Created by saeem  on 16/02/22.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // App storage property wrapper is used to store edit and recall its value using the device permanent storage.
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0 // This property is respresenting the asset value in the horizontal direction.
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing:20) {
               // MARK: - HEADER
                
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
                .opacity(isAnimating ? 1 : 0) // Here I am using a ternary operator (A ternary operator is a special phrase that we use to check and change values)
                // The above code is saying if the animation variable is true then the opacity value is 1 and if the animation variable value is value then the opacity value is zero.
                .offset(y: isAnimating ? 0 : -40)
                
                .animation(.easeInOut(duration: 1), value: isAnimating) // This line is an animation paramenter we I decided to add an easy out animation curve type This ease out slows down at the end of the animation with a predefined one second duration
                
                
                //MARK: - CENTER
                
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
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
                            .frame(width: buttonOffset + 80)
                        
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
                    .offset(x: buttonOffset)
                    .gesture(
                    DragGesture()
                        .onChanged{gesture in /* This value will give us information about actual movement */
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                buttonOffset = gesture.translation.width // This property is capturing the actual drag movement's width for later use.
                            }
                            // gesture.translation.width > 0 This property means that user can move button from left to right initially. so this statement is saying it will only run when the dragging has been started in the right direction.
                        }
                        .onEnded{ _ in
                            withAnimation(Animation.easeOut(duration: 0.4)) {
                                if buttonOffset > buttonWidth / 2 {
                                    buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = false
                                    
                                } else {
                                     buttonOffset = 0
                                }
                            }
                            
                        }
                    ) //: GESTURE
                        
                        
                        Spacer() // The spacer here pushed the button to the left edge and this button covers the capsule shaped beneath
                        
                    }//: Hstack
                    
                    
                }//:Footer
                .frame(width: buttonWidth,height: 80, alignment: .center)
                .padding(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                // .frame here is a modifier to the container to navigate the cursor to the end of the z
            }//: Vstack
        }//: Zstack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}
// Vstack is a verticla stack container this will allow us to add more views after each other.

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
