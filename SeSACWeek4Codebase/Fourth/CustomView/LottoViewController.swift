//
//  LottoViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/24/25.
//

import UIKit


import Alamofire //추가


class LottoViewController: UIViewController {
    
    let resulLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resulLabel)
        resulLabel.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view)
        }
        resulLabel.backgroundColor = .yellow
        resulLabel.text = "테스트"
        callRequst()
        
    }
    
    func callRequst() {
        print(#function)
        
        //"Alamofire 사용법"
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1181"
        //let url = "https://api.upbit.com/v1/market/all"
        //request메서드를 호출 :요청했으니 응답도
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Lotto.self) { response in
            
            //validate (404에러같은): "상태코드" : 보통은 200번대는 성공, 400번대는 보통 클라이언트 문제 : Alamofire에서는 200번대는 기본으로 설정되어 있어서 생략되어 있음 //500번대는 실패로 나옴 : 몇번대로 설정하느냐에 따라 성공여부 갈림 : 중요!
            
            //식판에 잘 담겼는지 안담겼는지 체크 : 성공,실패(인터넷느림, 끊김 등등)
            switch response.result {
            case .success(let value):
                print("success", value)
                
                self.resulLabel.text = value.drwNoDate //이런 스위치 중괄호 안에서는 self.가 필수: 명확히 해주는 것
                
            case .failure(let error):
                print("fail", error)
            }
            
            
            
            print("response start")
            print(response) //식판에 잘 잠기는지 꼭 체크
            print("response end")
        }
//        AF.request(url, method: .get).responseString { response in
//            print("response start")
//            print(response) //스트링값(외부)으로 응답을 줌 : 이걸 어떻게 변환을 해서 활용할 것인가 : swift에서는 struct(식판)로 담아줌 :이 과정을 "역직렬화(decoding)":ios에서 쓸수 있는 형태로 만드는 과정 : 식판에 넣기
//            //근데 식판에 잘못 담길 수도 있다 : 로또의 회차를 혹시 빼먹었다면? : 응답이 "실패"로 뜸 : 우리가 주의해야할 부분
//            //아예 url 주소 자체가 잘못되어 있을 경우 : 에러 뜸(요청 자체가 실패)
//            //주의1. URL이 잘못되어서 요청도 안되는 경우
//            //주의2. 필요한 정보를 누락해서 제대로 된 응답이 안오는 경우
//            //주의3. 서버에서는 응답을 잘 해줬지만 , 식판에 데이터가 안담기는 경우
        
//            //체크1. "responseString"으로 알맞은 데이터가 오고 있는지 확인!
//            //체크2. 구조체(식판)를 만들기
//            print("response end") //이게 응답보다 먼저 프린트되는걸 알수 있음 : "비동기" : 인터넷이 느리거나 끊길 때: 우선은 요청 함수를 끝나고 나중에 응답을 받음
//        }
        print("callRequst end")
    }


}
