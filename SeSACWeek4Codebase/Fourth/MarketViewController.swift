//
//  MarketViewController.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/23/25.
//

import UIKit

import SnapKit





protocol Mentor { }

class SeSAC { }
class Jack : SeSAC { }
class Bran : SeSAC, Mentor { }
class Hue { }

struct Finn: Mentor { }
struct Den { }





class MarketViewController: UIViewController {

    let tableViews = UITableView()
    
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
        
        
        
        
        
        configureHierarchy()
        configureView()
        configureLayout()
        
    }
   
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as! MarketTableViewCell
        
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
        self.tableViews.backgroundColor = .orange
        self.tableViews.rowHeight = 60
        
        tableViews.dataSource = self
        tableViews.delegate = self
        
        //코드베이스는 xib가 없는데?
        //xib자리 대신 MarketTableViewCell.self
        tableViews.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)
    }
    
    func configureLayout() {
        tableViews.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide) //꽉차게
        }
        
    }
    
    
}
