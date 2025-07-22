//
//  UserDefaultsHelper.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/22/25.
//

import Foundation


struct UserDefaultsHelper {
    //연산 프로프티 활용해서 UserDefaults.standard어쩌구를 줄여보자
    var name: String {
        get { //implicit return : 한 줄은 return 생략가능
            UserDefaults.standard.string(forKey: "name") ?? "손님"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
    var age: Int {
        get {
            UserDefaults.standard.integer(forKey: "age")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "age")
        }
    }
}
