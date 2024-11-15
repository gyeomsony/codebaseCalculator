//
//  ViewController.swift
//  calculator
//
//  Created by 손겸 on 11/14/24.
//
import UIKit
import SnapKit

// MARK: - UI 로직
class ViewController: UIViewController {
    
    var label = UILabel()
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
        
        label.text = "0"
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
        button7 = buttons(title: "7", action: #selector(buttonTapped), backgroundColor: .darkGray)
        button8 = buttons(title: "8", action: #selector(buttonTapped), backgroundColor: .darkGray)
        button9 = buttons(title: "9", action: #selector(buttonTapped), backgroundColor: .darkGray)
        plusButton = buttons(title: "+", action: #selector(operatorButtonTapped), backgroundColor: .orange)
        
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
        button4 = buttons(title: "4", action: #selector(buttonTapped), backgroundColor: .darkGray)
        button5 = buttons(title: "5", action: #selector(buttonTapped), backgroundColor: .darkGray)
        button6 = buttons(title: "6", action: #selector(buttonTapped), backgroundColor: .darkGray)
        minusButton = buttons(title: "-", action: #selector(operatorButtonTapped), backgroundColor: .orange)
        
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
        button1 = buttons(title: "1", action: #selector(buttonTapped), backgroundColor: .darkGray)
        button2 = buttons(title: "2", action: #selector(buttonTapped), backgroundColor: .darkGray)
        button3 = buttons(title: "3", action: #selector(buttonTapped), backgroundColor: .darkGray)
        multiplyButton = buttons(title: "*", action: #selector(operatorButtonTapped), backgroundColor: .orange)
        
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
        initButton = buttons(title: "AC", action: #selector(initButtonTapped), backgroundColor: .orange)
        button0 = buttons(title: "0", action: #selector(buttonTapped), backgroundColor: .darkGray)
        resultButton = buttons(title: "=", action: #selector(resultButtonTapped), backgroundColor: .orange)
        divButton = buttons(title: "/", action: #selector(operatorButtonTapped), backgroundColor: .orange)
        
        // 네번째 줄 스택뷰
        let lastStackView = makeHorizontalStackView([initButton, button0, resultButton, divButton])
        view.addSubview(lastStackView)
        
        lastStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(thirdStackView.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
        
        let mainStackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView, lastStackView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.distribution = .fillEqually
        
        view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - 버튼 구성
    
    func buttons(title: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted) // 버튼 눌렸을 때 번호 색 변경, 버튼 누르고 있는 동안만 적용
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.frame.size = CGSize(width: 80, height: 80)
        button.layer.cornerRadius = 40
        
        //액션 추가
        button.addTarget(self, action: action, for: .touchUpInside)
        
        return button
    }
    // MARK: - 스택뷰 구성
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        
        return stackView
    }
    
    // MARK: - 결과 계산 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    // MARK: - 버튼 액션
    
    // 숫자버튼 액션
    @objc private func buttonTapped(sender: UIButton) {
        var currentText = label.text ?? "" // 현재 label 텍스트
        
        // 버튼 타이틀 가져오기
        let buttonText = sender.title(for: .normal) ?? ""
        
        
        // 버튼 클릭 시, label 텍스트 뒤에 버튼 텍스트 추가
        currentText += buttonText
        
        // 0으로 시작하면 0 제거
        if currentText.hasPrefix("0") && currentText.count > 1 {
            currentText.removeFirst()
        }
        
        // 새로운 텍스트로 label 업데이트
        label.text = currentText
        print("\(sender.title(for: .normal) ?? "") 버튼 클릭됨")
    }
    
    // 연산자버튼 액션
    @objc private func operatorButtonTapped(sender: UIButton) {
        guard var currentText = label.text else { return }
        
        // 연산자 추가
        let operatorText = sender.title(for: .normal) ?? ""
        
        currentText += " " + operatorText + " "
        
        label.text = currentText
        print("\(sender.title(for: .normal) ?? "") 연산자 버튼 클릭 됨")
    }
    
    // 결과버튼 액션
    @objc private func resultButtonTapped(sender: UIButton) {
        print("결과 버튼 클릭됨")
    }
    
    // 초기화 버튼 액션
    @objc private func initButtonTapped(seder: UIButton) {
        self.label.text = "0"
        print("초기화 버튼 클릭됨")
    }
    //#Preview {
    //    ViewController()
    //}
    
}
