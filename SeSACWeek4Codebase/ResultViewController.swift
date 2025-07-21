//
//  ResultViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/21/25.
//

import UIKit

import SnapKit //추가

class ResultViewController: UIViewController {
//여기에도 이니셜라이즈가 숨어 있는거니까 뷰컨에서 인스터스 생성으로 사용가능
//    init() {
//
//    }
//
    
    //아웃렛 대신 뭐가 추가 됐는지 알아야함
    //1.객체(레이블, 클래스의 인스턴스, 오브젝트들 등등) 얹음
    //2.배치
    //3.아웃렛 연결
    
    //1,2번이 필요
    
    let resultLabel = UILabel() //인스턴스 생성해서 resultLabel에 담았다 :3번 과정 대신
    
    let redView = UIView()
    let blackView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //SnapKit기반 : 레이아웃 코드만 바뀜
        view.addSubview(resultLabel) //순서도 레이아웃보다 먼저
        redView.addSubview(blackView) //레브뷰안에 블랙뷰
        
        resultLabel.snp.makeConstraints{ make in //make.leading.equalTo(view).offset(20)
            //make.trailing.equalTo(view).offset(-20)
            //make.leading.trailing.equalTo(view).offset(20)//리딩과 트레일링이 같은 간격이므로 한줄로 줄일수 있다: 마이너스 값도 플러스로 되버려서 :inset(20)로 변경해야함
            //make.leading.trailing.equalTo(view).inset(20)
            make.horizontalEdges.equalTo(view).inset(20) //같은 의미 make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(44)
        }
        resultLabel.backgroundColor = .systemGreen
        view.addSubview(redView)
        view.addSubview(blackView)
        
        redView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            //make.height.equalTo(100)
            //make.width.equalTo(100)
            make.width.height.equalTo(100) //위에 두줄을 한줄로
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
        }
        redView.backgroundColor = .red
        blackView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom).offset(50)
            //make.leading.equalTo(view) // 같은의미 : make.leading.equalToSuperview()
            //make.leading.equalToSuperview().offset(20)
            //make.trailing.equalToSuperview().offset(-20)
            //make.leading.trailing.equalToSuperview().inset(20) //한줄로
            make.horizontalEdges.equalToSuperview().inset(20) //leading.trailing가  horizontalEdges
            //make.verticalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-50)
            
            //레드뷰에 맞춰 똑같이 할때 : 레드뷰가 먼저 레이아웃이 잡혀 있어야 겠지 : 순서 주의
            //make.leading.equalTo(redView.snp.leading)
            //make.trailing.equalTo(redView.snp.trailing)
            make.horizontalEdges.equalTo(redView.snp.horizontalEdges)
            //make.top.equalTo(redView.snp.top)
            //make.bottom.equalTo(redView.snp.bottom)
            make.verticalEdges.equalTo(redView.snp.verticalEdges)
            //두줄로 줄인걸 또 한줄로 줄이는것도 가능
            make.edges.equalTo(redView).offset(20) //4개의 레이아웃이 다 동일한 경우 + offset여백 20 추가
            make.edges.equalTo(redView).inset(20) //4개의 레이아웃이 다 동일한 경우 + inset여백 20 추가


        }
        blackView.backgroundColor = .black

        
       
    }
    
    //viewDidLoad에 했던걸 함수로 아래로 빼두자
    
    func practiceAutoLayoutBased() {
        
        //프레임기준(옛날에 아이폰이 한 사이즈이던 시절)말고 오토레이아웃 기준으로
        view.addSubview(resultLabel) //addSubview안하면 런타임 이슈 발생하니까 빼먹지 않게: 안보이는 이슈는 레이아웃을 잘못 잡아서임: 이런 경우 프레임으로 잡아보고 보이는지 안보이는만 체크해서 수치를 잡고 다시ㄱㄱ
        
        //레이아웃 잡기전
        //AutoResizing기능 끄기: 필수
        resultLabel.translatesAutoresizingMaskIntoConstraints = false //아래에서 만든 안보이던 레이블이 보임 : 이게 false로 되어 있어야 모든 레이아웃이 적용됨, true로 되면 기본 레이아웃(오토레이아웃 잡기 전 상태:AutoResizing기능: 레이아웃 설정한 순간 꺼짐 : 오토레이아웃과 동시 적용 불가)이라 안보임
        
//        //우리가 스토리보드에서 잡은 오토레이아웃(NSLayoutConstraint) //위 20 왼 오 20 높이 44
//        let leading = NSLayoutConstraint(item: resultLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
//        //toItem: view == uiview기준으로 잡을래, constant: 20 == 간격20
//        //leading.isActive = true //오토레이아웃의 빨간줄:뒤에 .isActive = true로 한줄로도 작성 가능
//        let trailing = NSLayoutConstraint(item: resultLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20) //-20인 이유:
//        let bottom = NSLayoutConstraint(item: resultLabel, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -20)
//        let top = NSLayoutConstraint(item: resultLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44)

//        //이렇게 길게 안짜도 됨 : 좀더 간단하게
//        //.isActive = true 대신
//        view.addConstraints([leading, trailing, bottom, top])
        
        //더 간소하게 쓸 수 있는 방법이 NSLayoutAnchor
        // NSLayoutConstraint 와 NSLayoutAnchor 합친게 snapkit
        NSLayoutConstraint.activate([resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                     resultLabel.heightAnchor.constraint(equalToConstant: 44),
                                     resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        resultLabel.backgroundColor = .systemGreen

    }
    
    //viewDidLoad에 했던걸 함수로 아래로 빼두자

    func practiceFrameBased() {
        
        //Frame Based Layout:프레임 기반 레이아웃 기준으로 하면 아래처럼: 작은 아이폰에서는 문제 발생->오토레이아웃기준으로 다시
        //view.addSubview(redView) //addSubview를 한 "순서대로" 스토리보드에 생겨서 같은 위치에 뒤면 레드뷰가 블랙뷰 뒤로 겹쳐서 안보임 : addSubview의 순서 주의!
        view.addSubview(blackView) //uiView안에 레드뷰, 블랙뷰를 넣는다.: 바탕뷰를 기준으로 x,y축 위치를 잡음
        blackView.addSubview(redView) //블랙뷰안에 레드뷰가 들어가 있는 형태 :블랙뷰를 기준으로 x,y축 위치를 잡음
        //frame은 상대적인 위치를 기준으로 잡아
        
        redView.frame = CGRect(x: 100, y: 150, width:100, height: 100)
        blackView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
        blackView.layer.cornerRadius = 20
        blackView.clipsToBounds = true //바깥을 다 잘라
        
        redView.backgroundColor = .red
        blackView.backgroundColor = .black
        
        
        //1번 대신 : 객체 얹기(추가)
        view.addSubview(resultLabel)
        
        //2번 대신 : 객체 배치
        resultLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        
        //여태 스토리보드에서 오브젝트들에 기본적으로 있던 Label글자 같은 것도 아예 없어서 제대로 생성됐는지 확인 필요
        resultLabel.backgroundColor = .purple
        resultLabel.text = "보이는지 확인용"
        
        
        //스토리보드에 없는 상태에서 코드로 뷰컨 연결하면 투명색으로 보여서 꼭 배경색 필요
        view.backgroundColor = .white
    }
    

}
