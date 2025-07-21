//
//  ViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/21/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
        //"Function Type" Preview : 함수 이름만 쓰는게 어색 : 결국엔 "타입" : 모든 변수가 가진 타입 //어떤 매개변수, 어떤 반환값을 갖는지에 따라 달라짐
        //함수 호출연산자 : 괄호()
        //함수 이름과 실행을 별개로 가져가려고 한다.
        //jack() //이렇게만 쓰면반환값을 어디에 쓸꺼냐고 언유즈드 경고 뜸 : 아래처럼 해결
        //let a = jack() //여기서 a는 스트링 타입이 됨 : 리턴값에 의해 : 함수를 실행하고난 결과물
        //let a = jack //실행되지 않고 함수 내용(기능)만 들어 있는 상태 : a의 타입이 스트링이 아니고 ()->string이 됨
        //let b: () -> String = jack //실행되지 않고 함수 내용만 들어 있는 상태
        //print(a)
        //let b : () -> Int = finn()
    }
    func finn(a: Int) -> Int { // 여기의 Function Type 은 (int) -> int
        return a * 2
    }
    func finnn() ->Int {
        return 4
    }
    func den() -> String { //여기의 Function Type 은 ()->string
        return "테스트"
    }
    
    //매개변수는 없고 반환값은 스트링인 함수: 잭이라는 메서드를 호출해서 사용
    func jack() -> String {
        print("=")
        return "안녕하세요"
    }
    //항상 같은 이름의 함수 쓰지 않기
    @objc func goButtonClicked() { //여기 괄호는 "실행"
        
        //let vc1 = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        //리절트뷰컨 오브젝트를 안만들고(스토리보드에 없을때) 코코아터치 뷰컨 파일만 만들고 코드로 만들기
        //스토리보드가 있는데 아래처럼 하면 에러
        let vc2 = ResultViewController() //ResultViewController도 클래스이기 때문에 인스턴스 생성(초기화) //여기서 괄호는 : 클래스 안에 아무것도 없지만 클래스는 사용하고 싶을 떄 : 인스턴스라는 공간을 만들게 되고 그럼 빈 괄호가 됨: 우리 눈에 보이지 않는 init(이니셜라이즈의 줄임)이라는 기능이 자동으로 지원됨: 이니셜라이즈가 된다 cf)함수의 호출 연산자와 모양은 같지만 다른 역할
        
        present(vc2, animated: true)
        
        //스토리보드가 없으면 레이블같은 오브젝트들은 어떻게 올리지?
        
    }

}

