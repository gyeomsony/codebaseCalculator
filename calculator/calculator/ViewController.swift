//
//  ViewController.swift
//  calculator
//
//  Created by 손겸 on 11/14/24.
//
/*
 Lv.1
 🧑🏻‍💻 `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.

 - **속성**
     - `backgroundColor = .black`
     - `textColor = .white`
     - 우선, 텍스트는 `12345` 로 고정
     - 텍스트 오른쪽 정렬
     - Font = 시스템 볼드체, 사이즈 60
 - **AutoLayout**
     - leading, trailing = superView 로 부터 30 떨어지도록 세팅
     - top = superView 로 부터 200 떨어지도록 세팅
     - height = 100
 
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
        
        }
        
    }
    

