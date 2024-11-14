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
    
    var button7 = UIButton()
    var button8 = UIButton()
    var button9 = UIButton()
    var plusbutton = UIButton()
    var button4 = UIButton()
    var button5 = UIButton()
    var button6 = UIButton()
    var minusbutton = UIButton()
    
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
        
        // 레이블
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(100)
            $0.top.equalTo(view.snp.top).offset(200)
        }
        
        // 첫번째 줄 버튼들 추가
        button7 = buttons(title: "7")
        button8 = buttons(title: "8")
        button9 = buttons(title: "9")
        plusbutton = buttons(title: "+")
        
        // 버튼들을 스택뷰에 추가
        let firstStackView = makeHorizontalStackView([button7, button8, button9, plusbutton])
        view.addSubview(firstStackView)
        
        firstStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.height.equalTo(80)
            
            // 두번째 줄 버튼들 추가
            button4 = buttons(title: "4")
            button5 = buttons(title: "5")
            button6 = buttons(title: "6")
            minusbutton = buttons(title: "-")
            
            // 버튼들을 스택뷰에 추가
            let secondStackView = makeHorizontalStackView([button4, button5, button6, minusbutton])
                    view.addSubview(secondStackView)
            
            secondStackView.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(30)
                $0.trailing.equalToSuperview().offset(-30)
                $0.top.equalTo(firstStackView.snp.bottom).offset(10)
                $0.height.equalTo(80)
                
            }
        }
        
        func buttons(title: String) -> UIButton {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.frame.size = CGSize(width: 80, height: 80)
            button.layer.cornerRadius = 40
            
            return button
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
        
        func makeHorizontalStackView2(_ views: [UIView]) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = .horizontal
            stackView.backgroundColor = .black
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            
            return stackView
            
        }
    }
}
