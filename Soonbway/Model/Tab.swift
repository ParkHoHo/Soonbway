//
//  Tab.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

/// Tabs
enum Tab : String, CaseIterable {
    case home = "Home"
    case map = "Map"
    case favorites = "Favorites"
    case profile = "Profile"
//    case logout = "Logout"
    
    var symbol : String {
        switch self {
        case .home : return "house.fill"
        case .map : return "map"
        case .favorites : return "heart.fill"
        case .profile : return "person.crop.circle"
//        case .logout : return "rectangle.portrait.and.arrow.forward.fill"
        }
    }
    
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .home:
            Image(systemName: "calendar")
            Text(self.rawValue)
        case .map:
            Image(systemName: "map")
            Text(self.rawValue)
        case .favorites:
            Image(systemName: "heart.fill")
            Text(self.rawValue)
        case .profile:
            Image(systemName: "person.crop.circle")
            Text(self.rawValue)
//        case .logout:
//            Image(systemName: "rectangle.portrait.and.arrow.forward.fill")
//            Text(self.rawValue)
        }
    }
}



