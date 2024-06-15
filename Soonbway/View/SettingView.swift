//
//  SettingView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct SettingView : View {
    
    
    var body: some View {

        Button(action: {
            
        }, label: {
            VStack(spacing:20) {
                Image(systemName: "arrowshape.backward.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:80)
                Text("Update Soon")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
        })
       
    }
}

#Preview {
    SettingView()
}


