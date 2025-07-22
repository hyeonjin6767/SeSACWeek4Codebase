//
//  ViewDesignProtocol.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/22/25.
//

import Foundation

//import UIKit //UIKit도 프로토콜 기반으로 되어있다

//프로토콜("요구사항"을 명시한다.) : Method Requirements, Property Requirements
//특징1. 강제성 :회사가면 강제성있게 이렇게 그룹을 만들려고 했구나라는 느낌
//인터페이스(가이드 역할) 청사진
//명세만 할뿐, 구현은 구현부에서 알아서

//uikit class에서만 쓸 거같다 ":AnyObject"를 붙여서 :그러면 클래스에서만 채택해서 쓸 수 있게 지정
protocol ViewDesignProtocol: AnyObject { //클래스에서만 사용한 프로토콜은 애니오브젝트를 채택하면 됨
    
    //cf)
    //Any vs AnyObject(클래스 기반) : 차이점:
//    let a: [Any] = [0, false, "sgsd", UILabel()] //Any는 밑도끝도 없이 다 들어갈수있음
//    let a: [AnyObject] = [0, false, "sgsd", UILabel()] //AnyObject는 클래스 인스턴스만 들어갈 수 있음
    //0, false, "sgsd"이런 타입들은 다 사실은 구조체라서 AnyObject에 못들어가
    func configureHierarchy() //이름만 지정해두고
    func configureView()
    func configureLayout()
}
