//
//  Book.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/25/25.
//

import Foundation

//네이버 북을 식판에 담자 (: Decodable 빼먹지 말자)

struct BookInfo: Decodable {
    let items: [BookData]
}

struct BookData : Decodable {
    let title: String
    let link: String
    let author: String
    let pubdate: String
    let description: String
    
}
