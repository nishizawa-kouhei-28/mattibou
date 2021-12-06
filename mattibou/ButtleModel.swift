//
//  ButtleModel.swift
//  ichiichiMatch
//
//  Created by cmStudent on 2021/12/01.
//

import Foundation

// MARK: バトル画面のViewModel
class ButtleViewModel: ObservableObject {
    
    private let buttleModel = ButtleModel()
    
    var name1p: String = "1P" // 名前
    var name2p: String = "2P"
    
    var hand1: Int = 1    //1p
    var hand2: Int = 1
    
    var hand3: Int = 1   //2p
    var hand4: Int = 1
    
    var useHandNum: Int = 1 // 自分間でやりとりする時、何本移すか
    
    @Published var isTurn: Bool = true //ターン　true:1p  false:2p
    
    @Published var isBtn1: Bool = false // ボタン使用のオンオフ trueで押せなくなる
    @Published var isBtn2: Bool = false
    @Published var isBtn3: Bool = false
    @Published var isBtn4: Bool = false
    
    @Published var is5Btn1: Bool = false //指の本数が０のときボタンを押せなくする
    @Published var is5Btn2: Bool = false
    @Published var is5Btn3: Bool = false
    @Published var is5Btn4: Bool = false
    
    @Published var isFrame1: Bool = false // 選択した手に枠をつける
    @Published var isFrame2: Bool = false
    @Published var isFrame3: Bool = false
    @Published var isFrame4: Bool = false
    
    @Published var txt1p: String = ""  //どっちのターンか表示
    @Published var txt2p: String = ""
    
    var firstHandNum: Int = 0 // 一度目に選択した手を一時的に保存する
    
    @Published var hand1Image: String = "finger_1" // 画像名
    @Published var hand2Image: String = "finger_1"
    @Published var hand3Image: String = "finger_1"
    @Published var hand4Image: String = "finger_1"
    

    // 1回目の手選択
    func firstHand(_ hand: Int) {
        switch hand {
        case 1:
            isFrame1 = true     //枠つけ
            
            isBtn1 = true       //一回目に押したボタンを押せなくする
            isBtn2 = false
            isBtn3 = false
            isBtn4 = false
            
            is5Btn2 = false     //自分の手は０でもたたける
            
        case 2:
            isFrame2 = true
            
            isBtn1 = false
            isBtn2 = true
            isBtn3 = false
            isBtn4 = false
            
            is5Btn1 = false
            
        case 3:
            isFrame3 = true
            
            isBtn1 = false
            isBtn2 = false
            isBtn3 = true
            isBtn4 = false
            
            is5Btn4 = false
            
        case 4:
            isFrame4 = true
            
            isBtn1 = false
            isBtn2 = false
            isBtn3 = false
            isBtn4 = true
            
            is5Btn3 = false
            
        default:
            print("firstHandえらー")
        }
        
        firstHandNum = hand
        
        //print("\(hand4)::\(isBtn4):\(is5Btn4)")
        
    }
    
    // 2回目の手選択
    // 第一引数：叩く自分の手  第二引数：叩かれる手
    func secondHand(myHand: Int, touchHand: Int) {
        switch myHand {
        case 1:
            switch touchHand {
            case 2:
                let handNum = (hand1, hand2)
                let calcHand = buttleModel.calcHandNum(handNum, useHandNum)
                
                hand1 = calcHand.calcOffenceNum
                imageChange(hand: 1, handNum: hand1)
                
                hand2 = calcHand.calcDefenceNum
                imageChange(hand: 2, handNum: hand2)
                
                allHabd5Check()
                
            case 3:
                let handNum = (hand1,hand3)
                hand3 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 3, handNum: hand3)
                
                allHabd5Check()
                
            case 4:
                
                let handNum = (hand1,hand4)
                hand4 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 4, handNum: hand4)
                
                allHabd5Check()
                
            default:
                print("touchHandえらー")
            }
            isFrame1 = false
        case 2:
            switch touchHand {
            case 1:
                let handNum = (hand2, hand1)
                let calcHand = buttleModel.calcHandNum(handNum, useHandNum)
                
                hand2 = calcHand.calcOffenceNum
                imageChange(hand: 2, handNum: hand2)
                
                hand1 = calcHand.calcDefenceNum
                imageChange(hand: 1, handNum: hand1)
                
                allHabd5Check()
                
            case 3:
                let handNum = (hand2,hand3)
                hand3 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 3, handNum: hand3)
                
                allHabd5Check()
                
            case 4:
                let handNum = (hand2,hand4)
                hand4 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 4, handNum: hand4)
                
                allHabd5Check()
                
            default:
                print("touchHandえらー")
            }
            isFrame2 = false
        case 3:
            switch touchHand {
            case 1:
                let handNum = (hand3,hand1)
                hand1 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 1, handNum: hand1)
                
                allHabd5Check()
                
            case 2:
                let handNum = (hand3,hand2)
                hand2 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 2, handNum: hand2)
                
                allHabd5Check()
                
            case 4:
                let handNum = (hand3, hand4)
                let calcHand = buttleModel.calcHandNum(handNum, useHandNum)
                
                hand3 = calcHand.calcOffenceNum
                imageChange(hand: 3, handNum: hand3)
                
                hand4 = calcHand.calcDefenceNum
                imageChange(hand: 4, handNum: hand4)
                
                allHabd5Check()
                
            default:
                print("touchHandえらー")
            }
            isFrame3 = false
        case 4:
            switch touchHand {
            case 1:
                let handNum = (hand4,hand1)
                hand1 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 1, handNum: hand1)
                
                allHabd5Check()
                
            case 2:
                let handNum = (hand4,hand2)
                hand2 = buttleModel.calcHandNum(handNum)
                imageChange(hand: 2, handNum: hand2)
                
                allHabd5Check()
                
            case 3:
                let handNum = (hand4, hand3)
                let calcHand = buttleModel.calcHandNum(handNum, useHandNum)
                
                hand4 = calcHand.calcOffenceNum
                imageChange(hand: 4, handNum: hand4)
                
                hand3 = calcHand.calcDefenceNum
                imageChange(hand: 3, handNum: hand3)
                
                allHabd5Check()
                
            default:
                print("touchHandえらー")
            }
            isFrame4 = false
            
        default:
            print("myHandエラー")
            
        }
        firstHandNum = 0
        checkLoss()
        isTurn = !isTurn
        turnChange(turn: isTurn)
        
        
        //print("\(hand4)::\(isBtn4):\(is5Btn4)")
        print("\(hand1) \(hand2)\n\(hand3) \(hand4)\n")
    }
    
    // ボタンタップ時の処理をまとめた
    func btnTouch(hand: Int) {
        if firstHandNum == 0 {
            firstHand(hand)
        } else {
            secondHand(myHand: firstHandNum, touchHand: hand)
        }
    }
    
    // ての画像をかえるやつ
    func imageChange(hand: Int, handNum: Int) {
        switch hand {
        case 1:
            switch handNum {
            case 1:
                hand1Image = "finger_1"
            case 2:
                hand1Image = "finger_2"
            case 3:
                hand1Image = "finger_3"
            case 4:
                hand1Image = "finger_4"
            case 0:
                hand1Image = "finger_0"
            default:
                print("imageえらー")
            }
        case 2:
            switch handNum {
            case 1:
                hand2Image = "finger_1"
            case 2:
                hand2Image = "finger_2"
            case 3:
                hand2Image = "finger_3"
            case 4:
                hand2Image = "finger_4"
            case 0:
                hand2Image = "finger_0"
            default:
                print("imageえらー")
            }
        case 3:
            switch handNum {
            case 1:
                hand3Image = "finger_1"
            case 2:
                hand3Image = "finger_2"
            case 3:
                hand3Image = "finger_3"
            case 4:
                hand3Image = "finger_4"
            case 0:
                hand3Image = "finger_0"
            default:
                print("imageえらー")
            }
        case 4:
            switch handNum {
            case 1:
                hand4Image = "finger_1"
            case 2:
                hand4Image = "finger_2"
            case 3:
                hand4Image = "finger_3"
            case 4:
                hand4Image = "finger_4"
            case 0:
                hand4Image = "finger_0"
            default:
                print("imageえらー")
            }
        default:
            print("imageえらー：手の選択")
        }
    }
    
    // ターン切り替えのやつ　自分の手のみ選択可能、テキスト表示
    func turnChange(turn: Bool) {
        
        // true：1P  false：2P
        if turn {
            isBtn1 = false
            isBtn2 = false
            isBtn3 = true
            isBtn4 = true
            
            txt1p = "\(name1p)のターン"
            txt2p = ""
        } else {
            isBtn1 = true
            isBtn2 = true
            isBtn3 = false
            isBtn4 = false
            
            txt1p = ""
            txt2p = "\(name2p)のターン"
        }
    }
    
    // 負け確認
    func checkLoss() {
        if hand1 == 0 && hand2 == 0 {
            print("1pまけ")
        }
        
        if hand3 == 0 && hand4 == 0 {
            print("2pまけ")
        }
    }
    
    // 指の本数が0のときボタンを押せなくする
    func hand5Check(hand: Int, handNum: Int) {
        if handNum == 0 {
            switch hand {
            case 1:
                is5Btn1 = true
            case 2:
                is5Btn2 = true
            case 3:
                is5Btn3 = true
            case 4:
                is5Btn4 = true
            default:
                print("はんd５Checkえらー")
            }
        } else {
            switch hand {
            case 1:
                is5Btn1 = false
            case 2:
                is5Btn2 = false
            case 3:
                is5Btn3 = false
            case 4:
                is5Btn4 = false
            default:
                print("はんd５Checkえらー")
            }

        }
    }
    
    func allHabd5Check() {
        hand5Check(hand: 1, handNum: hand1)
        hand5Check(hand: 2, handNum: hand2)
        hand5Check(hand: 3, handNum: hand3)
        hand5Check(hand: 4, handNum: hand4)
    }
    
}





// MARK: バトル画面のModel
struct ButtleModel {
    
    // 自分->相手の場合
    // offenceNum：叩く側の本数    defenceNum；叩かれる側の本数     戻り値：叩かれた側の本数（計算後）
    func calcHandNum(_ handNum: (offenceNum: Int, defenceNum: Int)) -> Int {
        return handCheck(handNum.offenceNum + handNum.defenceNum)
    }
    
    //　自分->自分の場合
    // offenceNum：叩く側の本数    defenceNum；叩かれる側の本数     useHand：移す本数
    // 戻り値  calcOffenceNum：叩く側の本数（計算後）  calcDefenceNum：叩かれる側の本数（計算後）
    func calcHandNum(_ handNum: (offenceNum: Int, defenceNum: Int), _ useHanuNum: Int)
    -> (calcOffenceNum: Int, calcDefenceNum: Int) {
        let calcOffenceNum = handNum.offenceNum - useHanuNum
        let calcDefenceNum = handCheck(handNum.defenceNum + useHanuNum)
        
        return (calcOffenceNum, calcDefenceNum)
    }
    
    func handCheck(_ num: Int) -> Int {
        if num == 5 {
            return 0
        } else if num > 5 {
            return num - 5
        }
        return num
    }
}





