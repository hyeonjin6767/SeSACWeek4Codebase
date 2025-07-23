//
//  PurpleTextField.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/23/25.
//

import UIKit


//상속은 한 개만 가능
class PurpleTextField: UITextField { //UITextField가 부모

    //override는 왜 있을까?
    //부모클래스에 init이 있나보다 그래서 자식에게 오면 override가 붙나 보다: 부모의 부모의 부모의 init: 최상위가 NSObject
    
    
    override init(frame: CGRect) { //코드로 뷰를 구성했을 때 실행되는 초기화 구문 : 상속으로 온 애
        super.init(frame: frame)
        print("코드 Init")
        self.borderStyle = .none
        self.font = .boldSystemFont(ofSize: 15)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemPurple.cgColor
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
        self.tintColor = .systemPurple
    }
    
    required init?(coder: NSCoder) { //스토리보드로 뷰를 구성했을 때 실행되는 초기화 구문 : 코드로 만들더라도 스토리보드 초기화 구문은 꼭 쓰게끔 애플이 만들어둠
        fatalError("init(coder:) has not been implemented")
        print("스토리보드 Init")
    }
    //"프로토콜 안에" 있는 init을 쓰려면 앞에 required가 붙어야 하는 애플의 규칙 : 프로토콜에 있는 애
    //required 키워드는 프로토콜에 있다는걸 알려주는 역할
    
    /* 위에꺼와 같은 거 이건 fix한거
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    
    
}
