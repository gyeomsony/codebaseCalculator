//
//  ViewController.swift
//  calculator
//
//  Created by 손겸 on 11/14/24.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    // 첫번째 줄
    var button7 = UIButton()
    var button8 = UIButton()
    var button9 = UIButton()
    var plusButton = UIButton()
    // 두번째 줄
    var button4 = UIButton()
    var button5 = UIButton()
    var button6 = UIButton()
    var minusButton = UIButton()
    // 세번째 줄
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var multiplyButton = UIButton()
    // 네번째 줄
    var initButton = UIButton()
    var button0 = UIButton()
    var resultButton = UIButton()
    var divButton = UIButton()
    
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
        
        // 첫번째 줄 버튼들
        button7 = buttons(title: "7", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        button8 = buttons(title: "8", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        button9 = buttons(title: "9", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        plusButton = buttons(title: "+", action: #selector(operatorButtonTapped(_:)), backgroundColor: .orange)
        
        // 첫번째 줄 스택뷰
        let firstStackView = makeHorizontalStackView([button7, button8, button9, plusButton])
        view.addSubview(firstStackView)
        
        firstStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(label.snp.bottom).offset(70)
            $0.height.equalTo(80)
        }
        
        // 두번째 줄 버튼들
        button4 = buttons(title: "4", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        button5 = buttons(title: "5", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        button6 = buttons(title: "6", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        minusButton = buttons(title: "-", action: #selector(operatorButtonTapped(_:)), backgroundColor: .orange)
        
        // 두번째 줄 스택뷰
        let secondStackView = makeHorizontalStackView([button4, button5, button6, minusButton])
        view.addSubview(secondStackView)
        
        secondStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(firstStackView.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
        
        // 세번째 줄 버튼들
        button1 = buttons(title: "1", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        button2 = buttons(title: "2", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        button3 = buttons(title: "3", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        multiplyButton = buttons(title: "*", action: #selector(operatorButtonTapped(_:)), backgroundColor: .orange)
        
        // 세번째 줄 스택뷰
        let thirdStackView = makeHorizontalStackView([button1, button2, button3, multiplyButton])
        view.addSubview(thirdStackView)
        
        thirdStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(secondStackView.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
        // 네번째 줄 버튼들
        initButton = buttons(title: "AC", action: #selector(buttonTapped(_:)), backgroundColor: .orange)
        button0 = buttons(title: "0", action: #selector(buttonTapped(_:)), backgroundColor: .darkGray)
        resultButton = buttons(title: "=", action: #selector(resultButtonTapped(_:)), backgroundColor: .orange)
        divButton = buttons(title: "/", action: #selector(operatorButtonTapped(_:)), backgroundColor: .orange)
        
        // 네번째 줄 스택뷰
        let lastStackView = makeHorizontalStackView([initButton, button0, resultButton, divButton])
        view.addSubview(lastStackView)
        
        lastStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(thirdStackView.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
    }
    // 버튼 구성
    func buttons(title: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.frame.size = CGSize(width: 80, height: 80)
        button.layer.cornerRadius = 40
        //액션 추가
        button.addTarget(self, action: action, for: .touchUpInside)
        
        return button
    }
    // 스택뷰 구성
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }
    // 숫자버튼 액션
    @objc private func buttonTapped(_ sender: UIButton) {
        print("\(sender.title(for: .normal) ?? "") 버튼 클릭됨")
    }
    // 연산자버튼 액션
    @objc private func operatorButtonTapped(_ sender: UIButton) {
        print("\(sender.title(for: .normal) ?? "") 연산자 버튼 클릭됨")
    }
    // 결과버튼 액션
    @objc private func resultButtonTapped(_ sender: UIButton) {
        print("결과 버튼 클릭됨")
    }
}
