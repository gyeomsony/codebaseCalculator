//
//  ViewController.swift
//  calculator
//
//  Created by 손겸 on 11/14/24.
//
/*
 Lv.2
 - **`UIButton` 속성**
     - `font = .boldSystemFont(ofSize: 30)`
     - `backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)`
     - `frame.size.height = 80`
     - `frame.size.width = 80`
     - `layer.cornerRadius = 40`
 - **`horizontalStackView` 속성**
     - `axis = .horizontal`
     - `backgroundColor = .black`
     - `spacing = 10`
     - `distribution = .fillEqually`
 - **`horizontalStackView AutoLayout`**
     - height = 80
 */


import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurUI()
        print("ViewController가 실행됨")
        
        
    }
    // 배경색 및 레이블 속성 설정
    private func configurUI() {
        view.backgroundColor = .black
        
        label.text = "12345"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        
        // 레이블과 버튼들을 view에 추가하여 화면에 표시되도록 설정
        [label]
            .forEach { view.addSubview($0) }
        
//        - **AutoLayout**
//            - leading, trailing = superView 로 부터 30 떨어지도록 세팅
//            - top = superView 로 부터 200 떨어지도록 세팅
//            - height = 100
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(100)
            $0.top.equalTo(view.snp.top).offset(200)
        }
        
        
        // 스택 뷰
        func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = .horizontal
            stackView.backgroundColor = .black
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            
            return stackView
        }
        
    }
    
}
