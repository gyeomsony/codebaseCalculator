//
//  ViewController.swift
//  countApp
//
//  Created by 손겸 on 11/14/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var number: Int = 0
    let label = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()
    
    // 초기화 버튼 추가
    let initButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurUI()
        
        print("ViewController가 잘 생성 되었음.")
    }
    private func configurUI() {
        view.backgroundColor = .black
        
        label.text = "\(number)"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        
        minusButton.setTitle("감소", for: .normal)
        minusButton.setTitleColor(.white, for: .normal)
        minusButton.backgroundColor = .red
        minusButton.layer.cornerRadius = 8
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchDown)
        
        plusButton.setTitle("증가", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.backgroundColor = .blue
        plusButton.layer.cornerRadius = 8
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchDown)
        
        initButton.setTitle("초기화", for: .normal)
        initButton.setTitleColor(.white, for: .normal)
        initButton.backgroundColor = .gray
        initButton.layer.cornerRadius = 8
        initButton.addTarget(self, action: #selector(initButtonTapped), for: .touchDown)
        
        // 레이블과 버튼들을 기본 `view`에 추가하여 화면에 표시되도록 설정
        [label, minusButton, plusButton, initButton]
            .forEach { view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.center.equalToSuperview()
        }
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(30)
            $0.trailing.equalTo(label.snp.leading).offset(-32)
        }
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(30)
            $0.leading.equalTo(label.snp.trailing).offset(32)
        }
        initButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(30)
            $0.top.equalTo(label.snp.bottom).offset(100)
       }
    }
    @objc
    private func minusButtonTapped() {
        self.number -= 1
        label.text = "\(number)"
    }
    @objc
    private func plusButtonTapped() {
        self.number += 1
        label.text = "\(number)"
    }
    @objc
    private func initButtonTapped() {
        self.number = 0
        label.text = "\(number)"
    }
}

