//
//  View+Extensions.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

extension String {
    func secondCharacter() -> String? {
        guard self.count >= 2 else {
            return nil // 문자열 길이가 2보다 작은 경우 nil 반환
        }
        let index = self.index(self.startIndex, offsetBy: 1)
        return String(self[index])
    }
}


extension View {
    @ViewBuilder
    func hSpacing(_ alignment : Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity,alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment : Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity,alignment: alignment)
    }
    
    var safeArea : UIEdgeInsets {
        if let windowScene  = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        
        return .zero
    }
    
    func format(date: Date,format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    /**
     func currencyString(_ value: Double,allowedDigits: Int = 2 ) -> String {
         let formatter = NumberFormatter()
         formatter.numberStyle = .currency
         formatter.maximumFractionDigits = allowedDigits
         
         return formatter.string(from: .init(value: value)) ?? ""
     }
     **/
   
    
    func currencyString(_ value: TimeInterval,allowedDigits: Int = 2 ) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour,.minute,.second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: TimeInterval(value)) ?? ""
    }

    
}

#Preview {
    ContentView()
}



