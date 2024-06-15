//
//  Home+SideBarView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct Home_SideBarView: View {
    @State private var showMenu : Bool = false
    @AppStorage("isFirstTime") private var isFirstTime : Bool = true
    @State private var activeTab : Tab = .home
    
    
    var body: some View {
       
        AnimatedSideBar(
            rotatesWhenExpands: true,
            disablesInteraction: true,
            sideMenuWidth: 200,
            cornerRadius: 25,
            showMenu: $showMenu
        ) { safeArea in
            NavigationStack {
                Home_TabView(activeTab: $activeTab)
                    .sheet(isPresented: $isFirstTime, content: {
                        IntroScreen()
                            .interactiveDismissDisabled()
                    })
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            showMenu.toggle()
                        }, label: {
                            Image(systemName: showMenu ? "xmark" : "line.3.horizontal")
                                .foregroundStyle(Color.primary)
                                .contentTransition(.symbolEffect)
                        })
                    }
                }
            }
        } menuView: { safeArea in
            SideBarMenuView(safeArea)
        } background: {_ in
            Rectangle()
                .fill(.black)
            
        }
    }
        
    
    @ViewBuilder
    func SideBarMenuView(_ safeArea: UIEdgeInsets) -> some View {
        VStack(alignment: .leading,spacing: 12){
            Text("Side Menu")
                .font(.largeTitle.bold())
                .padding(.bottom,10)
            
            SideBarButton(.home, onTap: {
                activeTab = .home
            })
            
            SideBarButton(.map,onTap: {
                activeTab = .map
            })
            
            SideBarButton(.favorites,onTap: {
                activeTab = .favorites
            })
            
           
            
            Spacer(minLength: 0)
            
            SideBarButton(.profile,onTap: {
                activeTab = .profile
            })
            
//            SideBarButton(.logout)
        }
        .padding(.horizontal,15)
        .padding(.vertical,20)
        .padding(.top,safeArea.top)
        .padding(.bottom,safeArea.bottom)
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        .environment(\.colorScheme,.dark)
        
    }
    
    @ViewBuilder
    func SideBarButton(_ tab : Tab,onTap: @escaping () -> () = { }) -> some View {
        Button(action: {
            activeTab = tab
             onTap()
            showMenu.toggle()
        },label: {
            HStack(spacing:12) {
                Image(systemName: tab.symbol)
                    .font(.title3)
                
                Text(tab.rawValue)
                    .font(.callout)
                
                Spacer(minLength: 0)
            }
            .padding(.vertical,10)
            .contentShape(.rect)
            .foregroundColor(Color.primary)
        })
    }
}

#Preview {
    Home_SideBarView()
}
