//
//  StartingView.swift
//  UnisportApp
//
//  Created by D K on 17.04.2025.
//

import SwiftUI


struct StartingView: View {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var isWelcomeShown = false
    
    var body: some View {
        Group {
            MainTabView()
                .fullScreenCover(isPresented: $isWelcomeShown) {
                    if #available(iOS 15.0, *) {
                        OnboardingContainerView()
                            .onDisappear {
                                UserDefaults.standard.set(true, forKey: "isWelcomeShown")
                            }
                    } else {
                        // Fallback on earlier versions
                    }
                }
                .onAppear {
                    if !UserDefaults.standard.bool(forKey: "isWelcomeShown") {
                        self.isWelcomeShown.toggle()
                    }
                }
        }
    }
}
