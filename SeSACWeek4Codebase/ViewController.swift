//
//  ViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/21/25.
//

import UIKit

//클래스, 스트럭트, 연산 프로퍼티
struct BMI {
    static var name = "고래밥" //썻다지웠다안하는애는 스태틱
    let height: Double //인스턴스 프로퍼티이자 저장 프로퍼티에 속한다.
    let weight: Double
    
//    func result() -> String {
//        let value = weight / (height * height)
//        if value < 18.5 {
//            print("저체중")
//        } else {
//            print("정상체중")
//        }
//    }
    //주로 저장프로퍼티를 통해 연산(get, set)을 한다. //때마다 값이 바뀌므로 let이 없고 var만 있다.
//    var result: String {
//        let value = weight / (height * height)
//        if value < 18.5 {
//            print("저체중")
//        } else {
//            print("정상체중")
//        }
//    }
    //위에꺼에 사실 아래처럼 get이 숨어있던거
    var result: String { //get만 있는 경우 get은 생략가능
        get {
            var value = weight / (height * height)
            if value < 18.5 {
                return("저체중") //implicit return : 한 줄은 return 생략가능 :여긴 여러줄이라 생략하면 에러
            } else {
                return "정상체중"
            }
        }
        set {
            BMI.name = newValue
        }
    }
    
    
    
}


class ViewController: UIViewController {

    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var goButton: UIButton!
    
    var bmi = BMI(height: 1.8, weight: 80)
    //이걸 10개 정도 선언하면? : 매번 공간 차지
    
    var nickname: String?
    var age: Int?

    
    
    var ud = UserDefaultsHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaults를 간결하게 쓸 수 있음
        print(ud.name, ud.age)
        
        UserDefaults.standard.set(100, forKey: "age") //이걸 연산프로퍼티 set안으로 넣으면 이렇게 길게 안써도 되고 간결하게 바로 변경가능 밑에밑에줄
        UserDefaults.standard.set("aa", forKey: "name")
        
        ud.name = "JACK" //애플이 정한 set의 newValue에 넣어줌
        ud.age = 345
        
        print(ud.name, ud.age)


    
        
        //변수명을 원래는 다르게 해야하지만 번거로워서 보통은 같은이름의 변수에 넣음
        //이름 똑같으면 간소화 가능해서 생략가능
        if let nickname = nickname, let age = age {
        }
        if let nickname, let age { //if let shorthand(이프렛 간소화:간단한 애들은 이렇게가 가능) //위아래 같은 의미
        }
        
        
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
        let vc2 = MarketViewController() //ResultViewController도 클래스이기 때문에 인스턴스 생성(초기화) //여기서 괄호는 : 클래스 안에 아무것도 없지만 클래스는 사용하고 싶을 떄 : 인스턴스라는 공간을 만들게 되고 그럼 빈 괄호가 됨: 우리 눈에 보이지 않는 init(이니셜라이즈의 줄임)이라는 기능이 자동으로 지원됨(이니셜라이즈가 된다) cf)함수의 호출 연산자와 모양은 같지만 다른 역할.
       present(vc2, animated: true)
        
        //스토리보드가 없으면 레이블같은 오브젝트들은 어떻게 올리지? : ResultViewController에서.
        
//        print(weightTextField?.text?.count) //  옵셔널 체이닝
//        print(heightTextField?.text)
        
        
        print(BMI.self.name) //사실 가운데 셀프가 생략되어 있음
        print(BMI.name)
        print(bmi.height, bmi.weight)
        let result = bmi.weight / (bmi.height * bmi.height)
        if result < 18.5 {
            print("저체중")
        } else {
            print("정상체중")
        }
        //나 뷰컨이라 present만 하면되는데 bmi계산 연산까지 해야됨?: 굳이 또 변수에 담아서 값들을 또한번 가져오기까지 해서 연산을 해야하나 그래서 위에 스트럭트 너가 연산해서 보내라 : bmi.도 안해도되고 좋지
        //print(bmi.result())
        //print(bmi.result)
        
        bmi.result = "sesac"
        print(BMI.name)

        
        
        
        /*
        
        //아래구문을 가드문으로
        //guard 주의사항 : "print를 꼭 써보자!"
        guard let height = heightTextField.text,
              height.count > 2 else {
            print("키 텍스트필드가 2글자 미만입니다.")
            return //여기서 끝나면 고버튼함수 자체도 완전 끝나버려서 리턴아래 print("키:", height)는  실행안되고 끝나니까 꼭 리턴 전에 프린트해보기! //그래서 둘 중 하나가 안되더라도 어떤 텍스트필드가 잘못 되었는지 특정할 수 있음

              }
        print("키:", height) // 앞에서 가드문에서 height이 이상이 없다는걸 확인했으므로 밖에서도 사용 가능한것.
        //바깥에서 height으로 지지고볶고 연산같은게 가능하다는 장점이 있음
        guard let weight = weightTextField.text,
              height.count > 2 else {
            return
              }
        print("키:", height)
        
        */
        
        
        //2글자 이상일때 실행되게
//        let height = heightTextField.text
//        if height?.count ?? 0 > 2 {
//            
//        } else {
//            
//        }
        /*
        //위에 구문을 if let으로
        if let height = heightTextField.text, height.count > 2  { //height을 앞에서 닐이 아닌걸 한번 체크했으면 뒤에 카운트 구문에서 체크 가능
            print(height)
            
        } else {
            print("키 텍스트필드가 2글자 미만입니다.")
        }
        if let weight = weightTextField.text, weight.count > 2  { //height을 앞에서 닐이 아닌걸 한번 체크했으면 뒤에 카운트 구문에서 체크 가능
            print(weight)
            
        } else {
            print("몸무게 텍스트필드가 2글자 미만입니다.")
        }
        //위에 두개의 이프문을 하나로
        //둘 중 하나가 안되더라도 어떤 텍스트필드가 잘못 되었는지 특정할 수 있음
        //두 변수(height, weight)가 쓸 수 있는 범위가 달라져서 합치는거에 장단점이 있음
        */
        
        
        /*
        //guard
        guard let weight = weightTextField.text,
              let height = heightTextField.text else { //중괄호의 순서에서 else문이 먼저 나옴 : 참이면 else문을 패스하고 리턴으로 바깥에 나와버림(early exit) + if let과 달리 중괄호 바깥에서도 사용가능
            print("weightTextField, heightTextField가 nil인 상태")
            return //early exit
              }
        
        
        //느낌표를 최대한 안쓰는 방향으로
       //옵셔널 바인딩
        if let weight = weightTextField.text,
            let height = heightTextField.text { //한번에 여러개도 가능
            //nil이 아닌지 체크되기 때문에 weight은 옵셔널 타입이 아니고 그냥 스트링 타입이 됨
            print(weight.count, height.count) //이제 카운트 앞에 물음표 안붙어도 됨
        } else {
            print("weightTextField, heightTextField가 nil인 상태")
        }
        //아래꺼를 위에껄로
        
//        let weight = weightTextField.text
//        let height = heightTextField.text
//        
//        //체크1. weight nil
//        //체크2. double nil
//        let result = Double(weight ?? "0") //1.예외처리
//        
//        print(result)
//
         */
        
        
    }

}

