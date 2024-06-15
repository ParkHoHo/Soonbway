//
//  CardView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct CardView: View {
    
    @StateObject private var viewModel = SubwayViewModel()
    
    
    

    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            
            VStack(spacing: 0) {
                HStack(spacing:12) {
                    Text("신창")
                        .font(.title.bold())
                    
                                        
                    Image(systemName: "tram")
                        .font(.title3)
                        /*.foregroundColor(expense > income ? .red : .green )*/
                }
                .padding(.bottom,25)
                
                HStack(spacing: 0) {
                    ForEach(Category.allCases,id: \.rawValue) { category in
                        let symbolImage = category == .departure ? "arrow.up" : "arrow.down"
                        let tint = category == .departure ? Color.green : Color.red
                        
                        HStack(spacing:10) {
                            Image(systemName: symbolImage)
                                .font(.callout.bold())
                                .foregroundStyle(tint)
                                .frame(width: 35,height: 35)
                                .background {
                                    Circle()
                                        .fill(tint.opacity(0.25).gradient)
                                }
                            
                            VStack(alignment: .leading,spacing: 4) {
                                Text(category.rawValue)
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                                
                                
                               
                                
                                let upSubway = viewModel.entireData.filter { $0.updnLine == "상행" }
                                let downSubway = viewModel.entireData.filter { $0.updnLine == "하행" }
                                
                                Text((category == .departure ? upSubway.first?.currentlocation ?? "운행종료" :downSubway.first?.currentlocation) ?? "운행종료")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                                
                                
                            }
                            
                            if category == .departure {
                                Spacer(minLength: 10)
                            }
                            
                        }
                    }
                    
                    .onAppear {
                        viewModel.getArrivalFirstData()
                    }
                }
            }
            .padding([.horizontal,.bottom],25)
            .padding(.top,15)
        }
    }
    
    
}

#Preview {
    ContentView()
    
}



