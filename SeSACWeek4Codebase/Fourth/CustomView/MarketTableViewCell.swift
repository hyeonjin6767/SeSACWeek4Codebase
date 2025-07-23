//
//  MarketTableViewCell.swift
//  SeSACWeek4Codebase
//
//  Created by 박현진 on 7/23/25.
//

import UIKit

import SnapKit //셀 레이아웃을 위한

class MarketTableViewCell: UITableViewCell {
    
    static let identifier = "MarketTableViewCell"
    
    
    let nameLabel = UILabel()

//    
//    //Nib은 xib이다 :  스토리보드이자 셀 : xib가 잇을때 사용 가능: 지금은 코드베이스로 짤꺼라 없으므로 사용불가
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//    }
    
    //셀에서 필요한 init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureView()
        configureLayout()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}


extension MarketTableViewCell: ViewDesignProtocol {
    
    func configureHierarchy() {
        //view?.addSubview(nameLabel)가 아니라 콜렉션뷰에는 뷰가 없고 "컨텐트뷰"가 있음
        //주의사항: 아래처럼 셀프로 쓰면 : 보이고 레이아웃도 잘 잡히지만 버튼 같은 클릭되는 요소들이 클릭이 안됨
        //self?.addSubview(nameLabel)
        //안전하게 contentView에 넣어주자
        contentView.addSubview(nameLabel)
    }
    
    func configureView() {
        nameLabel.text = "비트코인"
        nameLabel.textColor = .white
    }
    
    func configureLayout() {
        nameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(22)
            make.centerY.equalTo(contentView)
        }
    }
    
    
}
