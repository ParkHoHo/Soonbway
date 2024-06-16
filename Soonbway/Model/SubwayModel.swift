//
//  SubwayModel.swift
//  Soonbway
//
//  Created by ParkHoHo on 6/15/24.
//

import SwiftUI

struct SubwayResponse: Decodable {
    
    // get realtimeArrivalList Array
    var realtimeArrivalList: [SubwayArrival]
    
    enum CodingKeys: String, CodingKey {
        case realtimeArrivalList = "realtimeArrivalList"
    }
    
    struct SubwayArrival: Decodable {
        
        var id = UUID()
        let arvlCd: String
        let currentlocation: String
        let remain : String
        let barvlDt : String
        let updnLine : String
        let trainLineNm : String
        let statnNm : String
        
        enum CodingKeys: String, CodingKey {
            case arvlCd = "arvlCd"
            case remain = "arvlMsg2"
            case currentlocation = "arvlMsg3"
            case barvlDt = "barvlDt"
            case updnLine = "updnLine"
            case trainLineNm = "trainLineNm"
            case statnNm = "statnNm"
            
        }
        
    }

}

var sampleSubway : [SubwayResponse.SubwayArrival] = [
    .init(arvlCd: "99", currentlocation: "배방", remain: "[2]번째 전역", barvlDt: "0", updnLine: "하행", trainLineNm: "신창행 - 신창방면", statnNm: "신창"),
    
]




