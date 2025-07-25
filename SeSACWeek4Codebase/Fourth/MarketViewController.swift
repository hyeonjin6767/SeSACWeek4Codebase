//
//  MarketViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/23/25.
//

import UIKit

import SnapKit

import Alamofire



protocol Mentor { }

class SeSAC { }
class Jack : SeSAC { }
class Bran : SeSAC, Mentor { }
class Hue { }

struct Finn: Mentor { }
struct Den { }





class MarketViewController: UIViewController {
    
    //서버 통신 결과를 "테이블뷰에" "보여주고 싶다. :  배열을 테이블뷰에 보여주면 됨
    //var list: [String] = ["비트코인","이더리움","리플","도지코인"]
    //위에 식판을 확장하자
    var list: [Coin] = [Coin(market: "비트코인", korean_name: "코인", english_name: "Coin"),
                        Coin(market: "이더리움", korean_name: "이더", english_name: "Eth"),
                        Coin(market: "리플", korean_name: "리", english_name: "lif")]

    
    
    

    //let tableViews = UITableView()
    //lazy함수로 즉시 실행 함수로 다시 만들어보자
    lazy var tableViews = {
        let tableViews = UITableView()
        tableViews.backgroundColor = .orange
        tableViews.rowHeight = 60
        
        tableViews.dataSource = self //셀프랑 시점이 겹쳐서 에러나니까 레이지로 바꿔주자
        tableViews.delegate = self
        
        //코드베이스는 xib가 없는데?
        //xib자리 대신 MarketTableViewCell.self
        tableViews.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)
        return tableViews
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //var mentor : Jack = Jack()
        var mentor : SeSAC = Jack() //부모자리에 자식이 들어가는거 가능: 부모클래스에는 자식클래스가 들어갈 수 있다.
        //근데 프로토콜을 채택받으면
        //구조체이건 클래스이건 프로토콜을 채백 받았으면 타입을 프로토콜에 들어갈수 있다 : 타입으로서의 프로토콜: 프로토콜은 타입처럼 사용할 수 있다. : 그래서 tableViews.delegate = self 처럼 클래스가 프로토콜에 들어가는 것 같은 형태를 볼 수 있는것.
        //var mentor: Mentor = Finn()
        
        
        let a = Jack()
        let b = Bran()
        
        mentor = a
        //mentor = b //타입이 달라서 못들어옴
        
        
        callRequst()
        print("callRequst 메서드 이후")
        //callBoxoffice()
        
        
        configureHierarchy()
        configureView()
        configureLayout()
        
        
       
        
        
        //박스오피스 식판 만들기 대비
        func callBoxoffice() {
            //http는 안되고 https
            let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=a8f5d0105c1b678cf97bf63edfde6acb&targetDt=20120101" //url안에 내 키로 바꾸기, https로 바꾸기,
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Park.self) { response in
                
                //validate (404에러같은): "상태코드" : 보통은 200번대는 성공, 400번대는 보통 클라이언트 문제 : Alamofire에서는 200번대는 기본으로 설정되어 있어서 생략되어 있음 //500번대는 실패로 나옴 : 몇번대로 설정하느냐에 따라 성공여부 갈림 : 중요!
                
                //식판에 잘 담겼는지 안담겼는지 체크 : 성공,실패(인터넷 느림, 끊김 등등)
                switch response.result {
                case .success(let value):
                    print("secess", value)
                    
                   dump(value)
                    //value.boxOfficeResult.dailyBoxOfficeList[0].movieNm
                    
                case .failure(let error):
                    print("fail", error)
                }
                
                print("response start")
                //print(response) //식판에 잘 잠기는지 꼭 체크
                print("response end")
            }
                 
        }
        
        //Alamofire
        func callRequst() {
            print(#function, "첫번째")
            let url = "https://api.upbit.com/v1/market/all"
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: [Coin].self) { response in
                //responseDecodable는 시간이 오래 걸릴걸 알아서 다른 알바생한테 이를 잠ㄲ맡겨두고 중괄호 나가서 다음꺼 실행 :그래서 값이 변경 될때 테이블뷰 갱신은 필수
                print(#function, "두번째")

                //validate (404에러같은): "상태코드" : 보통은 200번대는 성공, 400번대는 보통 클라이언트 문제 : Alamofire에서는 200번대는 기본으로 설정되어 있어서 생략되어 있음 //500번대는 실패로 나옴 : 몇번대로 설정하느냐에 따라 성공여부 갈림 : 중요!
                
                //식판에 잘 담겼는지 안담겼는지 체크 : 성공,실패(인터넷느림, 끊김 등등)
                switch response.result {
                case .success(let value):
                    print("secess", value)
                    
                    print(value[2].korean_name)
                    print(value[2].english_name)
                    print(value[2].market)
                    
                    
                    //1.리스트에 내용을 담고
                    //2.테이블뷰 갱신 필수
                    self.list = value //응답온 데이터를 넣어줘서 리스트 데이터가 변경되었으니 꼭 갱신은 필수
                    self.tableViews.reloadData()
                    
                    
                    
                case .failure(let error):
                    print("fail", error)
                }
                
                print("response start")
                //print(response) //식판에 잘 잠기는지 꼭 체크
                print("response end")
            }
            print(#function, "세번째")
        }
    }
   
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as! MarketTableViewCell
        
        //cell.nameLabel.text = list[indexPath.row].market
        let row = list[indexPath.row]
        cell.nameLabel.text = "\(row.market) | \(row.english_name)(\(row.korean_name))" //이렇게말고 연산프로퍼티로 가져와보자
        cell.nameLabel.text = row.coinOverview //연산 프로퍼티 활용
        cell.backgroundColor = .blue
        
        return cell
        
    }
    
    
}

extension MarketViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(tableViews)
    }
    
    func configureView() {
        view.backgroundColor = .white
        //앞에 self(클래스의 인스턴스) : 보통 생략 / 뒤에 셀프는 "그 자체"의(가운데 셀프 생략하는거랑 같아) 의미//MarketTableViewCell.self.identifier
//        self.tableViews.backgroundColor = .orange
//        self.tableViews.rowHeight = 60
//        
//        tableViews.dataSource = self
//        tableViews.delegate = self
//        
//        //코드베이스는 xib가 없는데?
//        //xib자리 대신 MarketTableViewCell.self
//        tableViews.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)
    }
    
    func configureLayout() {
        tableViews.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide) //꽉차게
        }
        
    }
    
    
}
