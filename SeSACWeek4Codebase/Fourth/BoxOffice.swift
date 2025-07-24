//
//  BoxOffice.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/24/25.
//

import Foundation

//거꾸로 밑에서부터 만들면 좀 나아
//: Decodable빼먹지 않기!: 외부에서 받아오는거에 필수

struct Park: Decodable { //구조체 이름은 중요하지 않고 안에 변수이름
    let boxOfficeResult: Sesac
}

struct Sesac: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOffice]
    
}

struct BoxOffice: Decodable {
    let movieNm: String
    let openDt: String

}
