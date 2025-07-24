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
//        self.borderStyle = .none
//        self.font = .boldSystemFont(ofSize: 15)
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.systemPurple.cgColor
//        self.layer.cornerRadius = 8
//        self.backgroundColor = .white
//        self.tintColor = .systemPurple
    }
    
    
    
    
    
    //init은 커스텀도 가능
    //즉시 실행 함수에서도 반복되는 부분(placeholder,keyboardType)도 개선해보자
    init(placeholder: String, keyboard: UIKeyboardType) {
        //위에 init에서 복붙해옴..: 에러 잔뜩: super(부모클래스 초기화)안해서 에러 발생한거
        //내껄 초기화 하더라도 부모클래스의 프로퍼티도 모두 초기화를 먼저 해야 함!
        //super.init(frame: frame) //여긴 frame이 없는데 어떡하지? : 제약조건 설정하기 전에 위치값을 달라는 것:좌표:아무좌표나 넣어도 되는 이유가 어차피 나중에 스냅킷으로 레이아웃 다시 잡으니까 상관 없음
        super.init(frame: .zero) //super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        print("코드 custom init")
        
        self.placeholder = placeholder //얘네 둘을 위에 애플에 init에 만들고 싶은데 애플꺼는 못 수정해서 나의 커스텀 init을 따로 만드는 것
        self.keyboardType = keyboard
        
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
    
    /* 위에꺼와 같은 거 이건 자동으로 fix한거
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    
    
}
