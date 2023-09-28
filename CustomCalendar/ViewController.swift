//
//  ViewController.swift
//  CustomCalendar
//
//  Created by 김소진 on 2023/09/28.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    let calenderView = CalenderView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .gray245
        calenderView.roundCorners(cornerRadius: 9, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }

    func setup() {
        view.addSubview(calenderView)
        
        calenderView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).inset(100)
            $0.right.equalTo(view.snp.right).inset(12)
            $0.left.equalTo(view.snp.left).inset(12)
            $0.height.equalTo(400)
        }
    
    }
    
    

}
