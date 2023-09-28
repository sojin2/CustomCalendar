//
//  DatePickerButton.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//

import UIKit

public protocol DatePickerButtonDelegate: AnyObject {
  func pickerView(_ pickerView: UIPickerView, titleForRow: Int)
}

public class DatePickerButton: UIButton {
  
  public let pickerView = UIPickerView()
  
  public var pickerViewDelegate: UIPickerViewDelegate? {
    get {
      return pickerView.delegate
    }
    set {
      return pickerView.delegate = newValue
    }
  }
  public var pickerViewDataSource: UIPickerViewDataSource? {
    get {
      return pickerView.dataSource
    }
    set {
      return pickerView.dataSource = newValue
    }
  }
  
  public weak var delegate: DatePickerButtonDelegate?
  
  public override var inputView: UIView? {
    return pickerView
  }
  
  public override var inputAccessoryView: UIView? {
      let toolBar = UIToolbar()
      toolBar.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 44)
      toolBar.translatesAutoresizingMaskIntoConstraints = false
      
      let closeBtn = UIBarButtonItem(
          title: "닫기",
          style: .plain,
          target: self,
          action: #selector(didTapClose(_:))
      )
      let space = UIBarButtonItem(
          barButtonSystemItem: .flexibleSpace,
          target: nil,
          action: nil
      )
      let doneBtn = UIBarButtonItem(
          title: "완료",
          style: .done,
          target: self,
          action: #selector(didTapDone(_:))
      )

      let items = [closeBtn, space, doneBtn]
      toolBar.setItems(items, animated: false)
      toolBar.sizeToFit()
      toolBar.updateConstraintsIfNeeded()

      return toolBar
  }
  
  public override var canBecomeFirstResponder: Bool {
    return true
  }
  
  // MARK: - Initializer
  public override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    configureView()
  }
  
  // MARK: - Public Methods
  public func reloadData() {
    pickerView.reloadAllComponents()
  }
    
  public func setBackgroundColorForPicker(color: UIColor) {
    pickerView.backgroundColor = color
  }
  
}

// MARK: - Obj-C Methods
@objc
extension DatePickerButton {
  /// Close the picker view
  private func didTapClose(_ button: UIBarButtonItem) {
    closePickerView()
  }
  
  private func didTapDone(_ button: UIBarButtonItem) {
      let YearRow = pickerView.selectedRow(inComponent: pickerView.numberOfComponents - 2)
      let montRow = pickerView.selectedRow(inComponent: pickerView.numberOfComponents - 1)
      delegate?.pickerView(pickerView, titleForRow: YearRow)

      let year: String = (pickerView.delegate?.pickerView?(pickerView, titleForRow: YearRow, forComponent: pickerView.numberOfComponents - 2))!
      let month: String = (pickerView.delegate?.pickerView?(pickerView, titleForRow: montRow, forComponent: pickerView.numberOfComponents - 1))!
      
      setTitle("\(year) \(month)", for: .normal)

      closePickerView()
  }
  
  /// Open the picker view
  private func didTapButton() {
    becomeFirstResponder()
  }
  
}

// MARK: - Private Methods
extension DatePickerButton {
  
  private func configureView() {
    pickerView.delegate = pickerViewDelegate
    pickerView.dataSource = pickerViewDataSource
    self.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  private func closePickerView() {
    resignFirstResponder()
  }
  
}

