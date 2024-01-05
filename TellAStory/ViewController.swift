//
//  ViewController.swift
//  TellAStory
//
//  Created by Labe on 2024/1/4.
//

import UIKit
import AVFAudio

class ViewController: UIViewController, UITextFieldDelegate {

    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var mainCharacter: UITextField!
    @IBOutlet weak var seabedItem: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var seaFriend: UITextField!
    @IBOutlet weak var showStory: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainCharacter.delegate = self
        seabedItem.delegate = self
        destination.delegate = self
        seaFriend.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    @IBAction func buildStory(_ sender: Any) {
        let message:String = ("在一個被大海所環繞的小鎮裡，有一位名叫\(mainCharacter.text!)的女孩。她對海洋充滿著無限的好奇與熱愛。每當太陽升起，她會帶著潛水裝備，在海邊尋找新的奇跡。有一天，她在遠處的海底發現了\(seabedItem.text!)。在\(seabedItem.text!)中，她找到了一個閃閃發亮的寶盒。打開寶盒後，裡面有一張古老的地圖，指示著傳說中\(destination.text!)的方向。決心去尋找\(destination.text!)，\(mainCharacter.text!)展開了一場驚險刺激的海底冒險。她游過五顏六色的珊瑚礁，穿越七彩的海洋深淵，並遇見了友善的海洋生物，像是\(seaFriend.text!)和充滿智慧的海豚。最終，她找到了\(destination.text!)。這裡有著壯麗的巨石和閃耀的寶藏，但更重要的是，這裡住著一群友善和睦的海洋居民，他們樂於與\(mainCharacter.text!)分享他們的故事和智慧。返回家鄉後，\(mainCharacter.text!)分享了她在海底的奇妙經歷。她說明著，雖然她發現了寶藏，但更寶貴的是在旅途中所學到的互相尊重和珍惜的價值。這段海底的冒險使\(mainCharacter.text!)成為了一位擁有豐富心靈和深深連結大海的人。")
        showStory.text = message
        
        let utterance = AVSpeechUtterance(string: showStory.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utterance.rate = 0.2
        utterance.pitchMultiplier = 0.5
        synthesizer.speak(utterance)
    }
    
    
}



#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
