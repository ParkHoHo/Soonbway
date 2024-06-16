//
//  SubwayCardView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct SubwayCardView: View {
    @StateObject var viewModel = SubwayViewModel()
    var subwayData : SubwayResponse.SubwayArrival
    
    
    var body: some View {
        
        HStack(spacing: 12){
            Text("\(subwayData.currentlocation.prefix(1))")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 45,height: 45,alignment: .center)
                .background(.brown.gradient,in: .circle)
            
            VStack(alignment: .leading,spacing: 4) {
                Text("\(subwayData.currentlocation)")
                    .foregroundStyle(Color.primary)
                
                if let remainSubway = extractNumber(from: subwayData.remain) {
                    Text("\(remainSubway)개역 전")
                        .font(.caption)
                        .foregroundStyle(Color.primary.secondary)
                } else {
                    Text("신창 도착")
                        .font(.caption)
                        .foregroundStyle(Color.primary.secondary)
                }
                
                Text("\(subwayData.updnLine)")
                    .font(.caption)
                    .foregroundStyle(Color.primary.secondary)
            }
            .lineLimit(1)
            .hSpacing(.leading)
            
//            Text(currencyString(1000.0))
//                .fontWeight(.semibold)
            let status = subwayData.arvlCd == "1" ? "운행중" : subwayData.arvlCd == "99" ? "도착" : "기타"
            
            Text("\(status)")
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary.secondary)
        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        .background(.background,in:.rect(cornerRadius: 10))
    }
    
    func extractNumber(from string: String) -> String? {
        let pattern = #"\[([\d]+)\]"#
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        if let regex = regex {
            let matches = regex.matches(in: string, options: [], range: NSRange(string.startIndex..., in: string))
            if let match = matches.first {
                guard let matchRange = Range(match.range(at: 1), in: string) else { return "신창도착" }
                return String(string[matchRange])
            }
        }
        return nil
    }
    
}

#Preview {
    SubwayCardView(subwayData: sampleSubway[0])
}

