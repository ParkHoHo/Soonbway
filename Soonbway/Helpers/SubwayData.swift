//
//  SubwayData.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI
import Alamofire

// Request
class SubwayData {
    func getData(destination:String,completion: @escaping (Result<[SubwayResponse.SubwayArrival], Error>) -> Void) {
        let url = "http://swopenAPI.seoul.go.kr/api/subway/\(key)/json/realtimeStationArrival/0/6/\(destination)"
        
        AF.request(url).validate().responseDecodable(of: SubwayResponse.self) { response in
            switch response.result {
            case .success(let subwayResponse):
                completion(.success(subwayResponse.realtimeArrivalList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}



