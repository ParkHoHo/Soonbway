//
//  HomeView.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct HomeView : View {
    /// User Properties
    @AppStorage("userName") private var userName : String = ""
    
    /// View Properties
    @State private var startDate : Date = .now.startOfMonth
    @State private var endDate : Date = .now.endOfMonth
    @State private var showFilterView : Bool = false
    @State private var selectedCategory : Category = .arrival
    @State private var isActive : Bool = true
    @State private var buttonBackgroundColor: Color = .blue
    @State private var selectedSegment = 0
    
    var subwayViewModel = SubwayViewModel()
    
    /// For Animation
    @Namespace private var animation
    var body: some View {
        GeometryReader {
            /// For Animation Purpose
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing:10,pinnedViews: [.sectionHeaders]) {
                        Section {
                            /// Date Filter Button
                            Button(action: {
                                showFilterView = false
                            }, label: {
                                Text("\(format(date: startDate, format: "dd - MMM yy"))")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            })
                            .hSpacing(.leading)
                            
                            
                            /// Card View
                            CardView(viewModel: subwayViewModel)
                            
                            
                            /// custom Segmented Control
//                            CustomSegmentedControl()
                            CustomSegmentedControl(selectedSegment: $selectedSegment)
                            
                            
                            if selectedSegment == 0 {
                                // 출발 (상행)
                                ForEach(subwayViewModel.entireData.filter { $0.updnLine == "상행" }, id: \.currentlocation) { arrival in
                                    SubwayCardView(subwayData: arrival)
                                }
                            } else {
                                // 도착 (하행)
                                ForEach(subwayViewModel.entireData.filter { $0.updnLine == "하행" }, id: \.currentlocation) { arrival in
                                    SubwayCardView(subwayData: arrival)
                                }
                            }
                            
                            
                            
                        } header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
                .background(.gray.opacity(0.15))
                .blur(radius: showFilterView ? 8 : 0)
                .disabled(showFilterView)
            }
            .overlay {
                if showFilterView {
                    DateFilterView(start: startDate, end: endDate, onSubmit: { start, end in
                        startDate = start
                        endDate = end
                        showFilterView = false
                    }, onClose: {
                        showFilterView = false
                    })
                        .transition(.move(edge: .leading))
                }
                
            }
            .animation(.snappy, value: showFilterView)
            
        }
        .onAppear {
            subwayViewModel.getArrivalFirstData()
        }
    }
    
    /// Header View
    @ViewBuilder
    func HeaderView(_ size : CGSize) -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading,spacing:5, content: {
//                Text("Soonbway")
//                    .font(.title.bold())
                
                HackerTextView(text: "Soonbway", trigger: true)
                    .font(.title.bold())
                    .fontDesign(.rounded)

                
                if !userName.isEmpty {
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                    
                }
            })
            .visualEffect { content, geometryProxy in
                content
                    .scaleEffect(headerScale(size, proxy: geometryProxy),anchor: .topLeading)
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                // Button Action
                buttonBackgroundColor = isActive ? .gray : .blue
                isActive.toggle()
                
                
                DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                    isActive = true
                    buttonBackgroundColor = isActive ? .blue : .gray
                }
            
            }, label: {
                Image(systemName: "arrow.circlepath")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width:45,height:45)
                    .background(buttonBackgroundColor.gradient,in : .circle)
                    .contentShape(.circle)
            })
            .disabled(!isActive)
            
            
            
        }
        .padding(.bottom,userName.isEmpty ? 10 : 5)
        .background {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                Divider()
                   
            }
            .visualEffect { content, geometryProxy in
                content
                    .opacity(headerBGOpacity(geometryProxy))
            }
            .padding(.horizontal,-15)
            .padding(.top,-(safeArea.top + 15))
           
        }
        
    }
    
    
    @ViewBuilder
    func CustomSegmentedControl(selectedSegment: Binding<Int>) -> some View {
        let segments = ["출발", "도착"]
        
        HStack(spacing: 0) {
            ForEach(segments.indices, id: \.self) { index in
                Text(segments[index])
                    .hSpacing()
                    .padding(.vertical, 10)
                    .background {
                        if index == selectedSegment.wrappedValue {
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.capsule)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedSegment.wrappedValue = index
                        }
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
        .padding(.top, 5)
    }
    

    
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
//        print(minY)
        return minY > 0 ? 0 : (-minY / 15)
    }
    
    func headerScale(_ size : CGSize,proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress,0),1)) * 0.4
        return 1
    }
}

#Preview {
    HomeView()
}



