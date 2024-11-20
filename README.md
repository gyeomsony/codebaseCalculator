

# 계산기 앱 (Calculator App)

Swift와 UIKit을 사용해 개발한 간단한 계산기 애플리케이션입니다. **SnapKit** 라이브러리를 활용하여 UI를 구성하였으며, 사칙연산(덧셈, 뺄셈, 곱셈, 나눗셈)을 지원합니다.

---

## 주요 기능

- **사칙연산**: 덧셈, 뺄셈, 곱셈, 나눗셈 기능 제공
- **초기화(AC)**: `AC` 버튼으로 계산기를 초기화
- **동적 버튼 효과**: 버튼을 눌렀을 때 하이라이트 처리
- **오류 처리**: 잘못된 수식 입력 시 `Error` 표시
- **반응형 UI**: SnapKit을 이용해 모든 화면 크기에서 동작

---

## 스크린샷

<img width="434" alt="스크린샷 2024-11-20 오후 3 07 42" src="https://github.com/user-attachments/assets/68c85676-d44d-4e11-b8c4-10b93e4b63ea">

---

## 설치 방법

1. 이 저장소를 클론합니다:
   ```bash
   git clone https://github.com/yourusername/calculator.git
   ```
2. 프로젝트 디렉토리로 이동합니다:
   ```bash
   cd calculator
   ```
3. Xcode에서 프로젝트를 엽니다:
   ```bash
   open Calculator.xcodeproj
   ```
4. 시뮬레이터 또는 실제 기기에서 앱을 실행합니다.

---

## 코드 구성

### 1. **`ViewController.swift`**

이 파일은 계산기의 주요 로직을 포함하고 있습니다.

- **UI 요소**:
  - 레이블과 버튼을 코드로 생성.
  - SnapKit을 사용해 제약 조건 설정.
- **버튼 동작**:
  - `@objc private func buttonTapped`: 숫자 입력 처리.
  - `@objc private func operatorButtonTapped`: 연산자 중복 방지 처리.
  - `@objc private func resultButtonTapped`: 수식 계산.
  - `@objc private func initButtonTapped`: 계산기 초기화.
- **유틸리티 함수**:
  - `func buttons`: 버튼 속성을 설정해 반환.
  - `func calculate`: `NSExpression`을 사용하여 수식 계산.

---

## 트러블슈팅

### 문제 1: **숫자 입력 시 0이 앞에 남아있는 문제**
- **현상**: 사용자가 `0`으로 시작하는 숫자를 입력하면 `0001`처럼 여러 개의 0이 표시됨.
- **해결**: `buttonTapped`에서 텍스트가 `0`으로 시작하는 경우 첫 번째 문자를 제거하도록 로직 추가.

### 문제 2: **연산자가 중복으로 입력되는 문제**
- **현상**: 사용자가 `++` 또는 `--`처럼 연속된 연산자를 입력할 수 있었음.
- **해결**: `operatorButtonTapped`에서 마지막 문자가 연산자인 경우 연산자를 추가하지 않도록 조건문 추가.

### 문제 3: **수식 계산 시 오류**
- **현상**: 잘못된 수식 입력(`2+/3`) 시 앱이 충돌함.
- **해결**: `NSExpression`을 사용하여 안전하게 수식을 계산하고, 계산 불가능한 경우 `Error`를 표시하도록 수정.

---

## 사용한 라이브러리

- **SnapKit**: UI 제약 조건을 코드로 설정하기 위해 사용.
  ```swift
  pod 'SnapKit'
  ```
---
