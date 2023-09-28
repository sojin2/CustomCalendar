//
//  CalenderView+.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//
import UIKit

extension CalenderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonthIndex-1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! dateCell
        cell.backgroundColor = .white
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            let calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.dateLabel.text = "\(calcDate)"
            
            if currentYear == 2023 && currentMonthIndex == 9 && calcDate == 4 {
                cell.backgroundColor = .lightblue
            }
            
//            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
//                // 이전 날짜
//                cell.isUserInteractionEnabled = false
//                cell.datelabel.textColor = .gray85
//            } else {
//                // 이후 날짜
//                cell.isUserInteractionEnabled = true
//                cell.datelabel.textColor = .gray200
//
//            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let dateLabel = cell?.subviews[0] as! UILabel
        let dateText:String = dateLabel.text!
        cell?.backgroundColor = .blue
        
        print("선택 \(currentYear)년 \(currentMonthIndex)월 \(dateText)일" )
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .white
        let dateLabel = cell?.subviews[0] as! UILabel
        let dateText:String = dateLabel.text!
        print("취소 \(currentYear)년 \(currentMonthIndex)월 \(dateText)일" )
        //datelabel.textColor = .gray85
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7 - 8
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}

