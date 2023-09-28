//
//  dateCell.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//

import Foundation
import UIKit
import SnapKit
import Then

class dateCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.bottom.equalTo(self.snp.bottom)
        }
    }
    
    let dateLabel = UILabel().then {
        $0.text = "00"
        $0.textAlignment = .center
        $0.font = UIFont.fontWithName(type: .semibold, size: 16)
        $0.textColor = .gray85

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
