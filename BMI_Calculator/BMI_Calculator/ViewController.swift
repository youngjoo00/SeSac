//
//  ViewController.swift
//  BMI_Calcurator
//
//  Created by youngjoo on 1/3/24.
//


//1. 사용자가 tf에 입력
//2. tf 의 값이 변경되거나 변경이 끝나면, changedTextField 함수 실행되어 텍스트필드에 대한 유효성 검사 진행
//3. resultBtn 을 클릭하면 bmi 계산 및 Alert 띄우기
import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var askHeightLabel: UILabel!
    @IBOutlet var askWeightLabel: UILabel!
    
    @IBOutlet var inputHeightTextField: UITextField!
    @IBOutlet var inputWeightTextField: UITextField!
    
    @IBOutlet var randomCalculatorBtn: UIButton!
    @IBOutlet var resultBtn: UIButton!
    
    @IBOutlet var hideBtn: UIButton!
    
    var height: Double = 0
    var weight: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "BMI Calculator"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        subtitleLabel.text = "당신의 BMI 지수를\n알려드릴게요."
        subtitleLabel.numberOfLines = 0
        
        mainImageView.image = UIImage(named: "image")
        mainImageView.contentMode = .scaleToFill
        
        askHeightLabel.text = "키가 어떻게 되시나요?"
        askWeightLabel.text = "몸무게는 어떻게 되시나요?"
        
        setInputTextField(inputHeightTextField, placeholder: "키를 입력해주세요.")
        setInputTextField(inputWeightTextField, placeholder: "몸무게를 입력해주세요.")
        
        randomCalculatorBtn.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomCalculatorBtn.setTitleColor(.purple, for: .normal)

        inputWeightTextField.isSecureTextEntry = true
        hideBtnClicked(hideBtn)
        hideBtn.tintColor = .lightGray
        
        resultBtn.setTitle("결과 확인", for: .normal)
        resultBtn.layer.cornerRadius = 20
        resultBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        vaildationTextField()
    }

    // Bmi 계산함수 호출한 뒤, 알람창만 띄우는 역할
    @IBAction func resultBtnClicked(_ sender: UIButton) {
        
        let bmi = bmiCalculate()
        
        if bmi < 18.5 {
            showAlert(bmi, message: "저체중")
        } else if bmi < 23 {
            showAlert(bmi, message: "정상")
        } else if bmi < 25 {
            showAlert(bmi, message: "과체중")
        } else {
            showAlert(bmi, message: "비만")
        }
    }
    
    @IBAction func randomBmiBtnClicked(_ sender: UIButton) {
        let randomHeight = Double.random(in: 100...200)
        let randomWeight = Double.random(in: 40...100)
        inputHeightTextField.text = String(format: "%.1f", randomHeight)
        inputWeightTextField.text = String(format: "%.1f", randomWeight)
        
        vaildationTextField()
    }
    
    // 텍스트 필드가 수정되거나, 수정이 끝났을때 검사
    @IBAction func changedTextField(_ sender: UITextField) {
        vaildationTextField()
    }
    
    @IBAction func didEndTextField(_ sender: UITextField) {
        vaildationTextField()
    }
    
    @IBAction func hideBtnClicked(_ sender: UIButton) {
        // 비밀번호 입력처럼 가려져야 하고, 이미지가 변경되어야 함
        
        inputWeightTextField.isSecureTextEntry.toggle()
        
        if inputWeightTextField.isSecureTextEntry {
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func returnKeyboardClicked(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    func showAlert(_ bmi: Double, message: String) {
        let bmi = String(format: "%.2f", bmi)
        let alert = UIAlertController(title: "당신의 BMI 지수는 \(bmi) 입니다.", message: message, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "cancle", style: .cancel)
        let confirmButton = UIAlertAction(title: "ok", style: .default)
        
        alert.addAction(cancelButton)
        alert.addAction(confirmButton)
        
        present(alert, animated: true)
    }
    
    func vaildationTextField() {
        
        if let weight = Double(inputWeightTextField.text!), let height = Double(inputHeightTextField.text!), (weight > 0 && weight < 500), (height > 0 && height < 300) {
            designResultBtn(resultBtn, enabled: true)
            self.weight = weight
            self.height = height
        } else {
            designResultBtn(resultBtn, enabled: false)
        }
    }
    
    func bmiCalculate() -> Double {
        let bmi = self.weight / (self.height * self.height) * 10000
        return bmi
    }
    
    func setInputTextField(_ tf: UITextField, placeholder: String) {
        tf.layer.masksToBounds = true
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.black.cgColor
        tf.keyboardType = .decimalPad
        tf.placeholder = placeholder
    }
    
    func designResultBtn(_ resultBtn:UIButton, enabled: Bool) {
        resultBtn.isEnabled = enabled
        
        if resultBtn.isEnabled {
            resultBtn.setTitleColor(.white, for: .normal)
            resultBtn.backgroundColor = .purple
        } else {
            resultBtn.backgroundColor = .lightGray
            resultBtn.setTitleColor(.white, for: .normal)
        }
    }
}

