//
//  HomeView.swift
//  Restart
//
//  Created by saeem  on 16/02/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    // App storage property wrapper is used to store edit and recall its value using the device permanent storage.
    @State private var isAnimating: Bool = false
    // By using the above property I can tell some specific instruction to the program about what attributes we want to animate and how long we want to run this animation
    var body: some View {
        VStack(spacing:20) {
            
            // MARK: -HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                           , value: isAnimating
                           )
            }
            
            // MARK: -CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: -FOOTER
            
            Spacer()
            
            Button(action:{
                withAnimation{
                    isOnboardingViewActive = true
                }
                
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
                    
            }// Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            
        }// VStACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
                // Dispatch queue is responsible for executing any user or system activity it is an object that manages the execution of tasks serially or concurrently on your app's main thread or ona background thread.
                // The above code means we are telling the program to run our code inside this closure three seconds later from now and this how we can schedule a specific task in the mian thread of the application.
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
