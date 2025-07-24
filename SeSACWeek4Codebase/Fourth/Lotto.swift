//
//  Lotto.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/24/25.
//

import Foundation


//응답으로 받아온 스트링 덩어리를 구조체(식판)에 담자
struct Lotto: Decodable { //Decodable이라는 프로토콜 채택해서 씀
    
    let drwNoDate: String //변수명들 틀리면 안되니까 복붙으로 만들자
    let bnusNo: Int
}
