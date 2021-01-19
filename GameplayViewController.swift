//
//  GameplayViewController.swift
//  Stupid Test
//
//  Created by Chris Park on 1/16/21.
//

import Stevia
import UIKit

class GameplayViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let questionNumberLabel = UILabel()
    let timerLabel = UILabel()
    let hintButton = UIButton()
    let homeButton = UIButton()
    let questionLabel = UILabel()
    let choiceButton1 = UIButton()
    let choiceButton2 = UIButton()
    let choiceButton3 = UIButton()
    let choiceButton4 = UIButton()
    let bannerImageView = UIImageView()

    var count = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        styleSubviews()
        addButtonActions()
    }
    
    private func addButtonActions() {
        homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        choiceButton1.addTarget(self, action: #selector(choiceButtonTapped(_:)), for: .touchUpInside)
        choiceButton2.addTarget(self, action: #selector(choiceButtonTapped(_:)), for: .touchUpInside)
        choiceButton3.addTarget(self, action: #selector(choiceButtonTapped(_:)), for: .touchUpInside)
        choiceButton4.addTarget(self, action: #selector(choiceButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func homeButtonTapped() {
        hero.modalAnimationType = .selectBy(presenting:.push(direction: .left), dismissing:.pull(direction: .right))
        hero.unwindToRootViewController()
    }
    
    @objc private func choiceButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(message: "INCORRECT! Please subscribe and like.")
        } else if sender.tag == 1 {
            showAlert(message: "CORRECT! Please subscribe and like.")
        } else if sender.tag == 2 {
            showAlert(message: "INCORRECT! Please subscribe and like.")
        } else {
            showAlert(message: "INCORRECT! Please subscribe and like.")
        }
    }
    
    private func setUpSubviews() {
        view.subviews {
            backgroundImageView
            questionNumberLabel
            timerLabel
            hintButton
            homeButton
            questionLabel
            choiceButton1
            choiceButton2
            choiceButton3
            choiceButton4
            bannerImageView
        }
        
        backgroundImageView.fillContainer()
        
        questionNumberLabel.Top == view.safeAreaLayoutGuide.Top + 15
        questionNumberLabel.Left == view.Left + 5
        
        homeButton.CenterY == questionNumberLabel.CenterY
        homeButton.Right == view.Right - 5
        homeButton.width(50)
        homeButton.height(50)
        
        hintButton.CenterY == questionNumberLabel.CenterY
        hintButton.Right == homeButton.Left - 10
        hintButton.width(50)
        hintButton.height(50)
        
        timerLabel.CenterY == questionNumberLabel.CenterY
        timerLabel.Right == hintButton.Left - 20
        
        questionLabel.Top == questionNumberLabel.Bottom + 35
        questionLabel.Left == view.Left + 5
        questionLabel.Right == view.Right - 5
        
        choiceButton1.Top == questionLabel.Bottom + 30
        choiceButton1.CenterX == view.CenterX
        
        choiceButton2.Top == choiceButton1.Bottom + 25
        choiceButton2.CenterX == view.CenterX
        
        choiceButton3.Top == choiceButton2.Bottom + 25
        choiceButton3.CenterX == view.CenterX
        
        choiceButton4.Top == choiceButton3.Bottom + 25
        choiceButton4.CenterX == view.CenterX
        
        bannerImageView.Width == view.Width
        bannerImageView.height(85)
        bannerImageView.Bottom == view.safeAreaLayoutGuide.Bottom
    }
    
    private func styleSubviews() {
        backgroundImageView.image = UIImage(named: "background")
        
        questionNumberLabel.text = "QUESTION 1"
        questionNumberLabel.font = UIFont(name: "dosis-bold", size: 26)
        
        homeButton.setImage(UIImage(named: "house"), for: .normal)
        hintButton.setImage(UIImage(named: "hint"), for: .normal)
        
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 7, repeats: true) { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.hintButton.frame.origin.y -= 15
                }) { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.hintButton.frame.origin.y += 15
                    }) { _ in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.hintButton.frame.origin.y -= 15
                        }) { _ in
                            UIView.animate(withDuration: 0.3, animations: {
                                self.hintButton.frame.origin.y += 15
                            })
                        }
                    }
                }
            }
        }
        
        timerLabel.text = "00:00"
        timerLabel.font = UIFont(name: "dosis-light", size: 22)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.count += 1
            let minutes = Int(self.count) / 60 % 60
            let seconds = Int(self.count) % 60
            self.timerLabel.text = String(format:"%02i:%02i", minutes, seconds)
        }
        
        questionLabel.numberOfLines = 0
        questionLabel.text = "You're in 3rd place right now in a race. What place are you in when you pass the person in 2nd place?"
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont(name: "dosis-bold", size: 32)
        
        choiceButton1.setTitle("last", for: .normal)
        choiceButton1.setTitleColor(.black, for: .normal)
        choiceButton1.titleLabel?.font = UIFont(name: "dosis-light", size: 28)
        choiceButton1.tag = 0
        
        choiceButton2.setTitle("second", for: .normal)
        choiceButton2.setTitleColor(.black, for: .normal)
        choiceButton2.titleLabel?.font = UIFont(name: "dosis-light", size: 28)
        choiceButton2.tag = 1

        choiceButton3.setTitle("third", for: .normal)
        choiceButton3.setTitleColor(.black, for: .normal)
        choiceButton3.titleLabel?.font = UIFont(name: "dosis-light", size: 28)
        choiceButton3.tag = 2

        choiceButton4.setTitle("first", for: .normal)
        choiceButton4.setTitleColor(.black, for: .normal)
        choiceButton4.titleLabel?.font = UIFont(name: "dosis-light", size: 28)
        choiceButton4.tag = 3
        
        bannerImageView.image = UIImage(named: "subscribe")
    }
}
