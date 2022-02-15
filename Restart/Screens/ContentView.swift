//
//  ContentView.swift
//  Restart
//
//  Created by saeem  on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    //The first part of this app storage is a special SwiftUI property wrapper that will use the user's defaults
    //@AppStorage Its purpose is to store some value on the device's permanent storage by utilizing a getting set method
    // ("onboarding") This is a unique key identifier that we can refer to later on
    //isOnboardingView This is the Actual property name that we can use in this SwiftUI File.
    // The logic behind this code is that when users start the application, the very first screen they should see is the onboarding screen
    
    
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
    // Zstack is a container we can use it to display different views on the top of each other.
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
