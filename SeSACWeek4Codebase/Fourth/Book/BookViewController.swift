//
//  BookViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/25/25.
//

import UIKit
import Alamofire
import SnapKit


//다음주 예고..
//무한스크롤, 페이지네이션, 서비스적 고려
//상태코드 예외처리(네트워크 단절, 인증 콜 수 다써버림, 틀린 쿼리, 200번대가 아닌 다른 처리 등등)
//네트워크 통신 코드는 순서가 왜 다를까: 비동기 (다른 알바생)




class BookViewController: UIViewController {

    lazy var tableViews = {
        let tableViews = UITableView()
        tableViews.backgroundColor = .orange
        tableViews.rowHeight = 150
        
        tableViews.dataSource = self 
        tableViews.delegate = self
        
        tableViews.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
        return tableViews
    }()
    
    let searchBar = UISearchBar()
    
    //var list: [String] = ["국어","수학","영어","과학","사회"]
    
    var list: BookInfo = BookInfo(items: []) //아무것도 없는 상태 하나 만들어두고 응답 리스트에 데이터 넣어주기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        //callRequst() : 위치 중요

    }
    
    func callRequst(query: String) {
        print(#function, "첫번째")
        //let url = "https://openapi.naver.com/v1/search/book.json?query=수학" // 수학은 검색어: 변경
        let url = "https://openapi.naver.com/v1/search/book.json?query=\(query)&display=30" //검색어 뒤에 &display=30는 기본 설정이 10개만 보여주는거라고 홈피에 명시되어 있어서 30개 보여달라고 바꾼거.
        
            //메모리 누수?
        
        //“API를 요청할 때 다음 예와 같이 HTTP 요청 헤더에 "클라이언트 아이디"와 "클라이언트 시크릿"을 추가해야 합니다”
        let header: HTTPHeaders = ["X-Naver-Client-Id": "xA5LXXctMDL0kfcaEa4x",
                                   "X-Naver-Client-Secret": "xspwBdaWWj"]
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BookInfo.self) { response in
            print(#function, "두번째")
            switch response.result {
            case .success(let value):
                print("secess", value)
                
               dump(value)
                self.list = value
                self.tableViews.reloadData()
    
                
            case .failure(let error):
                print("fail", error)
            }
        }
        print(#function, "세번째")
    }

}

//서치바에는 에드타겟이 안되
extension BookViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { //입력 글자가 달라질때마다 실행
        print(#function)
    }
    //네이버에서는 콜(요청) 수의 제한(25000번)을 두고 있다 : 어떤 서버이든 제한이 존재: 실시간 검색기능이 그래서 보통은 잘 안써: 실시간 검색보다는 특정 단어 검색(키)
    //실시간 검색보다는 키보드 검색시 통신이 있는 경우가 많음
    //같은 검색어로 여러번 검색버튼이 눌리고 있음 : 이게 맞을까? : 이건 개발자가 막아줘야함+ 근데 또 신간 책이 들어올수도 있는건데 같은 검색어로 요청을 무조건 막는게 맞을까? : 고민해봐 ex글자수 제한같은 방법도...
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { //서치버튼 클릭시: 네트워크 통신(요청)시 사용하겟지
        print(#function)
        guard let text = searchBar.text, text.count > 0 else {
            print("빈값을 입력했어요")
            return
        }
        callRequst(query: text) //위치 주의

    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) { //서치바 끝에 엑스버튼:searchBar.showsCancelButton = true 이걸 눌러야 실행
        print(#function)
        //여기서 할게 생각보다 많아: 직접 사용해 보지 않으면 몰라 : 사용자가 더 편하게 쓸 환경 고려
        searchBar.text = ""
        list = BookInfo(items: [])
        tableViews.reloadData()
    }
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return list.count //  리스트가 배열이 아니라서 카운트값을 못써
        return list.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as! BookTableViewCell
        let row = list.items[indexPath.row]
        cell.titleLabel.text = row.title
        cell.subTitleLabel.text = row.author
        cell.overviewLabel.text = row.description
        cell.thumbnailImageView.backgroundColor = .blue
        return cell
    }
    
}

extension BookViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(tableViews)
        view.addSubview(searchBar)
    }
    
    func configureView() {
        view.backgroundColor = .white
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        tableViews.keyboardDismissMode = .onDrag //키보드는 언제 내려주지?: 무조건 내린다고 좋은 건 아니야: 보통은 스크롤할때 내려줌:카톡
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        tableViews.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
       
    }
}

