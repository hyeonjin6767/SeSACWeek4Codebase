//
//  JackNavigationProtocol.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/22/25.
//

import Foundation


//옵셔널 요구사항(Optional Requirements) : 쓸때도 있고 안쓸때도 있으면 앞에 옵셔널 추가  @objc optional func(여기도 오브젝트씨의 흔적이 남아 있어서 앞에 @objc붙어)

@objc protocol JackNavigationProtocol {
    
    
    
    //변수명을 다똑같이 쓰는 강제화를 해보겠다
    //프로퍼티의 최소 요구사항: "get"(get은 무조건 있어야 되고 set은 해도 되고 안해도되)
    var myTitle: String { get } //가지고 오는 용도로 쓰겟다: 최소 요구사항이 가져오는거 셋팅은 옵션
    var myButton: String { get set } //최소 요구사항이 가져오는거, 셋팅하는거 둘다 인거
    //프로토콜에서 프로퍼티는 저장프로퍼티로도 쓸 수 있고 연산프로퍼티로도 쓸 수 있다.

    
    
    
    
    func configure()
    @objc optional func configureButton()
}
