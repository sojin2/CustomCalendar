//
//  MonthView.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//


import UIKit
import SnapKit
import Then

protocol MonthViewDelegate: AnyObject {
    func didChangeMonth(monthIndex: Int, year: Int)
}

class MonthView: UIView {

    var monthsArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var currentMonthIndex = 0
    var currentYear: Int = 0
    var delegate: MonthViewDelegate?
    
    var availableYear: [Int] = []
    var allMonth: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var selectedYear = 2010
    var selectedMonth = 1
    var todayYear = "0"
    var todayMonth = "0"
    
    let monthView = UIView().then {
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 9, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = .gray239
    }
    
    let titleBtn = DatePickerButton().then {
        $0.backgroundColor = .white
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.fontWithName(type: .bold, size: 18)
    }
    
    let rightBtn = UIButton().then {
        $0.setImage(UIImage(named: "right_Arrow"), for: .normal)
        $0.tintColor = .black
    }
    
    let leftBtn = UIButton().then {
        $0.setImage(UIImage(named: "left_Arrow"), for: .normal)
        $0.tintColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setup()
        setAvailableDate()
        
        titleBtn.setTitle("\(currentYear)년 \(monthsArr[currentMonthIndex])월", for: .normal)
        titleBtn.addTarget(self, action: #selector(datePicker(sender:)), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        leftBtn.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
    }
    
    func setup() {
        addSubview(monthView)
        addSubview(lineView)
        addSubview(titleBtn)
        addSubview(rightBtn)
        addSubview(leftBtn)
        

        lineView.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom)
            $0.right.equalTo(self.snp.right)
            $0.left.equalTo(self.snp.left)
            $0.height.equalTo(1)
        }
        
        titleBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(21)
        }
        
        rightBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(titleBtn.snp.right).offset(10)
            $0.width.equalTo(10)
            $0.height.equalTo(50)
        }
        
        leftBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalTo(titleBtn.snp.left).offset(-10)
            $0.width.equalTo(10)
            $0.height.equalTo(50)
        }
    }
    
    @objc func datePicker(sender: UIButton) {
        titleBtn.pickerViewDelegate = self
        titleBtn.pickerViewDataSource = self
        titleBtn.delegate = self
    }
    
    func changeDate() {

        currentMonthIndex = selectedMonth - 1
        currentYear = selectedYear
        
        delegate?.didChangeMonth(monthIndex:  currentMonthIndex, year: currentYear)
    }
    
    @objc func btnLeftRightAction(sender: UIButton) {
        if sender == rightBtn {
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                currentMonthIndex = 0
                currentYear += 1
            }
        } else {
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
        }
        titleBtn.setTitle("\(currentYear)년 \(monthsArr[currentMonthIndex])월", for: .normal)
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    func setAvailableDate() {
        let formatterYear = DateFormatter()
        formatterYear.dateFormat = "yyyy"
        todayYear = formatterYear.string(from: Date())
            
        for i in 2010...Int(todayYear)! {
            availableYear.append(i)
        }
        
        let formatterMonth = DateFormatter()
        formatterMonth.dateFormat = "MM"
            
    }

}

