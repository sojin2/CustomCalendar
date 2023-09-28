//
//  WeekView.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//


import UIKit
import SnapKit
import Then

class WeekView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        addSubview(myStackView)
        
        myStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        let daysArr = ["일", "월", "화", "수", "목", "금", "토"]
        
        for i in 0..<7 {
            let weekLable = UILabel()
            weekLable.textAlignment = .center
            weekLable.textColor = .gray148
            weekLable.font = UIFont.fontWithName(type: .semibold, size: 14)
            weekLable.text = daysArr[i]
            myStackView.addArrangedSubview(weekLable)
        }
    }
    
    let myStackView = UIStackView().then {
        $0.distribution = .fillEqually
    }
    
}
