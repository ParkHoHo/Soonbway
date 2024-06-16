//
//  SoonBusView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/16/24.
//

import SwiftUI

struct SoonBusView : View {
    var body: some View {
        
        VStack(spacing:30) {
            
            Text("지하철을 놓쳤다면 \n통학버스를 타는건 어때요?")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
                .background(BubbleShape().fill(Color.cyan))
                .lineLimit(2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Button(action: {
                //https://sch.unibus.kr/#!/
                if let url = URL(string: "https://sch.unibus.kr/#!/") {
                       UIApplication.shared.open(url)
                    }
                
            }, label: {
                VStack(spacing:30) {
                    Image(systemName: "bus.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                        .foregroundStyle(.cyan)
                    Text("버스 예약으로\n이동하기")
                        .bold()
                        .foregroundStyle(.cyan)
                }
                
            })
            
        }
        
    }
}

struct BubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        path.move(to: CGPoint(x: rect.midX - 8, y: rect.height))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.height + 8))
        path.addLine(to: CGPoint(x: rect.midX + 8, y: rect.height))
        path.close()
        
        return Path(path.cgPath)
    }
}

#Preview {
    SoonBusView()
}
