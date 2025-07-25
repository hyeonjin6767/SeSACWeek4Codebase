//
//  Coin.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/24/25.
//

import Foundation


//코인 식판
struct Coin: Decodable {
    
    let market: String
    let korean_name: String
    let english_name: String
    
    //연산프로퍼티(가지고만 오는 통로 역할)
    var coinOverview: String {
        get { //겟은 여기서 한줄이라 생략가능
            return "\(market) | \(english_name)( \(korean_name))"
        }
    }
    
}
