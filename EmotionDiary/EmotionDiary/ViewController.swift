//
//  ViewController.swift
//  EmotionDiary
//
//  Created by youngjoo on 1/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emotionBtn1: UIButton!
    @IBOutlet var emotionBtn2: UIButton!
    @IBOutlet var emotionBtn3: UIButton!
    @IBOutlet var emotionBtn4: UIButton!
    @IBOutlet var emotionBtn5: UIButton!
    @IBOutlet var emotionBtn6: UIButton!
    @IBOutlet var emotionBtn7: UIButton!
    @IBOutlet var emotionBtn8: UIButton!
    @IBOutlet var emotionBtn9: UIButton!
    
    @IBOutlet var emotionLabel1: UILabel!
    @IBOutlet var emotionLabel2: UILabel!
    @IBOutlet var emotionLabel3: UILabel!
    @IBOutlet var emotionLabel4: UILabel!
    @IBOutlet var emotionLabel5: UILabel!
    @IBOutlet var emotionLabel6: UILabel!
    @IBOutlet var emotionLabel7: UILabel!
    @IBOutlet var emotionLabel8: UILabel!
    @IBOutlet var emotionLabel9: UILabel!
    
    var emotionLabelCount1 = 0
    var emotionLabelCount2 = 0
    var emotionLabelCount3 = 0
    var emotionLabelCount4 = 0
    var emotionLabelCount5 = 0
    var emotionLabelCount6 = 0
    var emotionLabelCount7 = 0
    var emotionLabelCount8 = 0
    var emotionLabelCount9 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupEmotionBtn(emotionBtn1)
        setupEmotionBtn(emotionBtn2)
        setupEmotionBtn(emotionBtn3)
        setupEmotionBtn(emotionBtn4)
        setupEmotionBtn(emotionBtn5)
        setupEmotionBtn(emotionBtn6)
        setupEmotionBtn(emotionBtn7)
        setupEmotionBtn(emotionBtn8)
        setupEmotionBtn(emotionBtn9)
        
        setupNavigationItem()
        
        let labelArr: [UILabel:String] = [
            emotionLabel1 : "행복해",
            emotionLabel2 : "좋아해",
            emotionLabel3 : "사랑해",
            emotionLabel4 : "당황해",
            emotionLabel5 : "속상해",
            emotionLabel6 : "우울해",
            emotionLabel7 : "심심해",
            emotionLabel8 : "따분해",
            emotionLabel9 : "어떡해",
        ]
        
        for (key, value) in labelArr {
            setupEmotionLabel(key, text: value)
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            emotionLabelCount1 += 1
            emotionLabel1.text = "행복해 \(emotionLabelCount1)"
            break
        case 1:
            emotionLabelCount2 += 1
            emotionLabel2.text = "좋아해 \(emotionLabelCount2)"
            break
        case 2:
            emotionLabelCount3 += 1
            emotionLabel3.text = "사랑해 \(emotionLabelCount3)"
            break
        case 3:
            emotionLabelCount4 += 1
            emotionLabel4.text = "당황해 \(emotionLabelCount4)"
            break
        case 4:
            emotionLabelCount5 += 1
            emotionLabel5.text = "당황해 \(emotionLabelCount5)"
            break
        case 5:
            emotionLabelCount6 += 1
            emotionLabel6.text = "당황해 \(emotionLabelCount6)"
            break
        case 6:
            emotionLabelCount7 += 1
            emotionLabel7.text = "당황해 \(emotionLabelCount7)"
            break
        case 7:
            emotionLabelCount8 += 1
            emotionLabel8.text = "당황해 \(emotionLabelCount8)"
            break
        case 8:
            emotionLabelCount9 += 1
            emotionLabel9.text = "당황해 \(emotionLabelCount9)"
            break
        default:
            break
        }
        
    }
    
    func setupEmotionBtn(_ btn: UIButton) {
        btn.setImage(UIImage(named: "slime\(btn.tag+1)"), for: .normal)
    }
    
    func setupEmotionLabel(_ label: UILabel, text: String) {
        let count = 0
        label.text = text + " \(count)"
        label.textAlignment = .center
    }
    
    func setupNavigationItem() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
}

