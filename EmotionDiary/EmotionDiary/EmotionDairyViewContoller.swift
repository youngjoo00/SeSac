//
//  testViewController.swift
//  EmotionDiary
//
//  Created by youngjoo on 1/3/24.
//

import UIKit

class EmotionDairyViewContoller: UIViewController {

    @IBOutlet var emotionBtns: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    @IBOutlet var backgroundImageView: UIImageView!
    
    let emotionLabelText: [String] = ["행복해", "좋아해", "사랑해", "당황해", "속상해", "우울해", "심심해", "따분해" , "어떡해"]
    var emotionLabelCount: [Int] = [
        UserDefaults.standard.integer(forKey: "emotionCount0"),
        UserDefaults.standard.integer(forKey: "emotionCount1"),
        UserDefaults.standard.integer(forKey: "emotionCount2"),
        UserDefaults.standard.integer(forKey: "emotionCount3"),
        UserDefaults.standard.integer(forKey: "emotionCount4"),
        UserDefaults.standard.integer(forKey: "emotionCount5"),
        UserDefaults.standard.integer(forKey: "emotionCount6"),
        UserDefaults.standard.integer(forKey: "emotionCount7"),
        UserDefaults.standard.integer(forKey: "emotionCount8")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = .background
        backgroundImageView.contentMode = .scaleAspectFill
        setupNavigationItem()
        
        for i in 0..<emotionBtns.count {
            setupEmotionBtn(emotionBtns[i])
            setupEmotionLabel(emotionLabels[i], text: "\(emotionLabelText[i]) \(emotionLabelCount[i])")
        }
    }
    
    @IBAction func emotionBtnClicked(_ sender: UIButton) {
        
        emotionLabelCount[sender.tag] += 1
        UserDefaults.standard.setValue(emotionLabelCount[sender.tag], forKey: "emotionCount\(sender.tag)")
        
        emotionLabels[sender.tag].text = "\(emotionLabelText[sender.tag]) \(emotionLabelCount[sender.tag])"
    }
    
    
    func setupEmotionBtn(_ btn: UIButton) {
        btn.setImage(UIImage(named: "slime\(btn.tag+1)"), for: .normal)
    }
    
    func setupEmotionLabel(_ label: UILabel, text: String) {
        label.text = text
        label.textAlignment = .center
    }
    
    func setupNavigationItem() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}
