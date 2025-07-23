//
//  SearchViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/22/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    
    
    
    //프로토콜로부터 가져와서 구체적으로 초기화
    var myTitle: String = "검색화면" //저장 프로퍼티로도 쓸 수 있고
    var myButton: String { //연산 프로퍼티로도 쓸 수 있다. //myButton는 get,set이 둘다 최소 요구사항이므로 둘다 꼭 있어야 함
        get {
            return "save"
        }
        set {
            
        }
    }
    
    
    
    
    //ViewDesignProtocol에서 이름만 만들어둔 함수들이 자동 채움하지 않으면 에러 : 애플이 프로토콜로 구조를 만들어둬서 왜 안쓰냐고 물어보는거
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        configureView()
        configureLayout()
        configureHierarchy()
        
    }
    
}

//프로토콜 함수들이 어디서 온건지 알아볼 수 있게 extension으로 깔끔하게 어디서 가져온 함수들인지 보이게
//시간이 지나면 어디서 온건지 알 수 있게 구분지어 둔것
extension SearchViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(label)
    }
    
    func configureView() {
        view.backgroundColor = .lightGray
        label.backgroundColor = .orange
    }
    
    func configureLayout() {
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(100)
        }
    }
}

//extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
//    
//}

extension SearchViewController: JackNavigationProtocol {
    
    
    
    
    
    func configure() {
        navigationItem.title = myTitle
    }
    
    func configureButton() {
        navigationItem.title = myTitle //에러나서 암거나 해둔거
    }
    
}
