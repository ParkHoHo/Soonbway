//
//  IntroScreen.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("isFirstTime") private var isFirstTime : Bool = true
    var body: some View {
        VStack(spacing:15) {
            Text("What's New in the\nSoonbway")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top,65)
                .padding(.bottom,35)
            
            ///Points View
            VStack(alignment: .leading,spacing: 25, content: {
                PointView(symbol: "tram.fill", title: "지하철 시간 제공", subTitle: "기존 번거로움을 해소하기 위해 지하철까지 남은 시간 제공")
                
                PointView(symbol: "location.fill", title: "위치 기반 서비스", subTitle: "지하철의 위치를 파악하고 이를 이용해서 도착시간 계산")
                
                PointView(symbol: "rectangle.stack.fill", title: "위젯 서비스", subTitle: "도착시간을 빠르게 확인하기 위한 잠금화면 위젯 지원")
            })
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,25)
            
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,14)
                    .background(appTint.gradient,in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    
    @ViewBuilder
    func PointView(symbol:String,title:String,subTitle:String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width:45)
            
            VStack(alignment: .leading,spacing: 6, content: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subTitle)
                    .foregroundStyle(.gray)
            })
        }
        
        
    }
}

#Preview {
    IntroScreen()
}



