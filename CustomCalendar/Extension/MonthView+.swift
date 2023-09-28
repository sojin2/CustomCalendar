//
//  MonthView+.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//

import UIKit

extension MonthView: UIPickerViewDataSource, UIPickerViewDelegate, DatePickerButtonDelegate {
    
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      switch component {
      case 0:
          return availableYear.count
      case 1:
          return allMonth.count
      default:
          return 0
      }
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      switch component {
      case 0:
          return "\(availableYear[row])년"
      case 1:
          return "\(allMonth[row])월"
      default:
          return ""
      }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      switch component {
      case 0:
          selectedYear = availableYear[row]
      case 1:
          selectedMonth = allMonth[row]
      default:
          break
      }
      
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow: Int) {
      changeDate()
  }
}
