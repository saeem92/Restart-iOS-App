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
        VStack(spacing:20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = false
                // The above code will help us to change the screen automatically once the program notices the change in the property 
            }) {
                Text("Start")
            }
        }
    }
}
// Vstack is a verticla stack container this will allow us to add more views after each other.

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
