//
//  AuthViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/23/25.
//

import UIKit

import SnapKit

class AuthViewController: UIViewController {
    
    //근데 또 익명함수로 쓰니까 반복이 너무많고 길어서 "클래스 상속"을 활용해보자 : extension으로 좋지만 많이 사용되지 않으면 별로인 방법
    
    let emailTextField = {
        print("이메일 익명 함수") //제일 일빠로 실행됨: "뷰디드로드보다 먼저"
        //let emailTextField = UITextField() //위에 있는 같은 변수명으로 일부러 작성 :근데 다른애
        let emailTextField = PurpleTextField(
            placeholder: "이메일을 작성해주세요",
            keyboard: .emailAddress)
//        emailTextField.placeholder = "이메일을 작성해주세요"
//        emailTextField.keyboardType = .emailAddress
//       
        return emailTextField //디자인된 애를 덮어씌우는 느낌으로
    }()
    // 원래 이렇게 하던거 let emailTextField = UITextField() 이렇게 안써도ㅇㅇ: 이미 디자인된 결과물을 바로 만드는건데 에러발생: 얘들은 인스턴스 프로퍼티 : 인스턴스 메서드와 생기는 시점이 달라서 불가능
    //인스턴스가 생성이 된다음에서야 인스턴스 메서드나 프로퍼티가 사용 가능한데 인스턴스를 만들면서 바로 메서드를 호출하는 격이니까 불가(아직 안만들어져서 인스턴스 메서드를 쓸 수 없음)
    //그럼 어떻게 해결? : 타입 메서드(인스터스 생성과 상관없이 언제든 갖다 쓸 수 있는애)로 만들기: static 붙이기
    
    //원래 이렇게 하던거 let passwordTextField = UITextField()
    let passwordTextField = {
        print("비밀번호 익명 함수")
        //let emailTextField = UITextField() //위에 있는 같은 이름의 변수명으로 일부러 작성 :근데 다른애
        let emailTextField = PurpleTextField(
            placeholder: "비밀번호를 작성해주세요",
            keyboard: .default)
//        emailTextField.placeholder = "비밀번호를 작성해주세요"
//        emailTextField.keyboardType = .default
        emailTextField.isSecureTextEntry = true
        
        return emailTextField //디자인된 애를 덮어씌우는 느낌으로
    }()
    
    //원래 이렇게 하던거 let ageTextField = UITextField()
    lazy var ageTextField = {
        print("나이 익명 함수")

        //let emailTextField = UITextField() //위에 있는 같은 이름의 변수명으로 일부러 작성 :근데 다른애
        let emailTextField = PurpleTextField(
            placeholder: "나이를 선택해주세요",
            keyboard: .numberPad)
        //아래 둘도 반복되서 init
//        emailTextField.placeholder = "나이를 선택해주세요"
//        emailTextField.keyboardType = .numberPad
        
        
        
        
        //emailTextField.inputView = UIPickerView() //키보드영역에 키보드 올라올 때 "inputView"로 키보드 대신에 UIPickerView로 대체하고 싶을때: 여러 종류들이 있음.. ex)UIDatePicker(): 날짜 선택
        //emailTextField.inputView = UIDatePicker()
        
        
        
        
        //ageTextField, picker가 같은 시점에 만들어져서 위에서 이 곳 뷰디드로드로 이동시킴: 약간의 지연을 주면 되지 않을까
        //해결책 : lazy: "지연 저장 프로퍼티" : var만 가능 : 조금 레이지해져서 초기화 시점을 조금이라도 미뤄준다.: 내부에서 인스턴스 프로퍼티(picker같은)를 사용하고 싶을 때 주로 사용
        emailTextField.inputView = picker
        
        

        
        return emailTextField //이미 디자인 완성된 애를 덮어씌우는 느낌으로
    }()
    
    @objc func datePickerValueChanged() {
        print(#function)
        ageTextField.text = "\(picker.date)"
    }
    
    
    
    //< 타입 메서드로 쓰고나서 단점 >
    //1. 타입 메서드로 활용했을 떄 공간이 영영 남아 있는 이슈
    //2. 각 뷰 객체 수마다 메서드 수가 늘어나는 이슈, 이 메서드는 재활용도 안되고 여기서만 쓰니까: 이름을 지어줄 필요도 없어서 함수 내용만 여기서 실행: 함수 내용(대괄호 통째)을 원래 아래에 쓰던거를 위로 올림 : "익명함수(클로저)"(일명 "즉시 실행 함수") //제일 일빠로 실행됨: "뷰디드로드보다도 먼저"


    let picker = UIDatePicker() //애도 UI속성이라 addtarget가능

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad() 시작")
        configureView()
        configureLayout()
        configureHierarchy()
        print("viewDidLoad() 끝")
        
        
        
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        //self도 인스턴스 프로퍼티라 생성 시점이 ageTextField와 같아 버려서 경고창 뜸..: 해결
        
        
        passwordTextField.delegate = self
        //이프문 대신 선택적으로 연결
        //emailTextField.delegate = self
        //ageTextField.delegate = self

    }

}

//코드로 액션 연결
extension AuthViewController: UITextFieldDelegate {
    
    //텍스트필드에 didEndonExit 액션이었던게 여기선 이거
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //if textField == passwordTextField { //passwordTextField.delegate = self 위에처럼 이런식으로 연결되어 있으면 자동으로 리턴 트루 되니까 이프문 안써도 되고 연결 안해주고 이프문으로 설정해도 됨
            print(#function)
            view.endEditing(true) //키보드 내려주는거까지 추가
            return true
        //}
    }
}




//마크업 렝기지(주석 같은거)
//MARK: UI 속성 정의
extension AuthViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(ageTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(20) //일정한 간격으로 나란히 놓을 때 equalto를 view의 세이프영역으로 일일히 할 필요가 없었네..
            make.height.equalTo(50)
        }
        ageTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
    }
    
    func configureView() {
        print(#function)
        view.backgroundColor = .white

    }
    
    func configureLayout() {
        view.backgroundColor = .white //에러나서 암거나 해둔거
        
    }
    
    
    
    // 인스턴스 메서드였다가 static 붙여서 "타입 메서드"로 변경해서 "즉시 실행 함수"로 사용하려고 위로 복붙
    // 타입 메서드 : 하나의 공간으로 쓰는 애
    
    
//    static func setEmailTextField() -> UITextField {
//        
//        let emailTextField = UITextField() //위에 있는 같은 변수명으로 일부러 작성 :근데 다른애
//        
//        emailTextField.placeholder = "이메일을 작성해주세요"
//        emailTextField.keyboardType = .emailAddress
//        emailTextField.borderStyle = .none
//        emailTextField.font = .boldSystemFont(ofSize: 15)
//        emailTextField.layer.borderWidth = 1
//        emailTextField.layer.borderColor = UIColor.systemPurple.cgColor
//        emailTextField.layer.cornerRadius = 8
//        emailTextField.backgroundColor = .white
//        emailTextField.tintColor = .systemPurple
//        
//        return emailTextField //디자인된 애를 덮어씌우는 느낌으로
//    }
    
//    static func setPasswordTextField() -> UITextField {
//        print(#function)
//        let emailTextField = UITextField() //위에 있는 같은 변수명으로 일부러 작성 :근데 다른애
//        
//        emailTextField.placeholder = "비밀번호를 작성해주세요"
//        emailTextField.keyboardType = .default
//        emailTextField.isSecureTextEntry = true
//        emailTextField.font = .boldSystemFont(ofSize: 15)
//        emailTextField.layer.borderWidth = 1
//        emailTextField.layer.borderColor = UIColor.systemPurple.cgColor
//        emailTextField.layer.cornerRadius = 8
//        emailTextField.backgroundColor = .white
//        emailTextField.tintColor = .systemPurple
//        
//        return emailTextField //디자인된 애를 덮어씌우는 느낌으로
//    }
    
//    static func setAgeTextField() -> UITextField {
//        print(#function)
//
//        let emailTextField = UITextField() //위에 있는 같은 변수명으로 일부러 작성 :근데 다른애
//        
//        emailTextField.placeholder = "나이를 선택해주세요"
//        emailTextField.keyboardType = .default
//        emailTextField.isSecureTextEntry = true
//        emailTextField.font = .boldSystemFont(ofSize: 15)
//        emailTextField.layer.borderWidth = 1
//        emailTextField.layer.borderColor = UIColor.systemPurple.cgColor
//        emailTextField.layer.cornerRadius = 8
//        emailTextField.backgroundColor = .white
//        emailTextField.tintColor = .systemPurple
//        
//        return emailTextField //디자인된 애를 덮어씌우는 느낌으로
//    }
    
}
