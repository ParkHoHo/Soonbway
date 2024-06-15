//
//  SubwayViewModel.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

class SubwayViewModel : ObservableObject {
    @Published var currentLocation : [String] = []
    @Published var remain : [String] = []
    @Published var entireData : [SubwayResponse.SubwayArrival] = []
    
        
        // data form modify
        func getArrivalFirstData() {
            SubwayData().getData(destination: "신창") { data in
                switch data {
                case .success(let arrivals) :
                    self.entireData = arrivals
                    print(self.entireData)
                    
                    
                    if let firstArrival = arrivals.first {
                        DispatchQueue.main.async {
                            self.currentLocation = [firstArrival.currentlocation]
                            self.remain = [firstArrival.remain]
                        }

                    }
                    
                    
                    
                case .failure(let error) :
                    print("Error:\(error)")
                
            }
        }
    }
}

