//
//  Home+TabView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct Home_TabView: View {
    /// Intro Visibility Status
    @AppStorage("ifFirstTime") private var isFirstTime : Bool = false
    ///Active Tab
    @Binding var activeTab : Tab
    var body: some View {
        TabView(selection: $activeTab) {
           HomeView()
                .tag(Tab.home)
                .tabItem { Tab.home.tabContent }
            
            SettingView()
                .tag(Tab.map)
                .tabItem { Tab.map.tabContent}
            
            SoonBusView()
                .tag(Tab.more)
                .tabItem { Tab.more.tabContent }
            
            SettingView()
                .tag(Tab.profile)
                .tabItem { Tab.profile
                    .tabContent }
                
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
        
        
    }
    
    
}

#Preview {
    ContentView()
}



