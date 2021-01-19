//
//  HomeViewController.swift
//  Stupid Test
//
//  Created by Chris Park on 1/15/21.
//

import Hero
import Stevia
import UIKit

extension UIViewController {
    func showAlert(title: String = "", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

class HomeViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let titleLabel = UILabel()
    let monsterImageView = UIImageView()
    
    let leftStackView = UIStackView()
    let rightStackView = UIStackView()
    
    let likeButton = UIButton()
    let moreButton = UIButton()
    let soundButton = UIButton()
    let rateButton = UIButton()
    let leaderboardButton = UIButton()
    let noAdsButton = UIButton()
    let helpButton = UIButton()
    let startButton = UIButton()
    
    let likeLabel = UILabel()
    let moreLabel = UILabel()
    let soundLabel = UILabel()
    let rateLabel = UILabel()
    let leaderboardLabel = UILabel()
    let helpLabel = UILabel()
    
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
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        soundButton.addTarget(self, action: #selector(soundButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        let levelsViewController = LevelsViewController()
        levelsViewController.modalPresentationStyle = .fullScreen
        levelsViewController.hero.isEnabled = true
        levelsViewController.hero.modalAnimationType = .push(direction: .left)
        present(levelsViewController, animated: true, completion: nil)
    }
    
    @objc private func soundButtonTapped() {
        if soundButton.imageView?.image?.pngData() == UIImage(named: "sound")?.pngData() {
            soundButton.setImage(UIImage(named: "mute"), for: .normal)
            AudioManager.shared.muteBGM()
            UserDefaults.standard.setValue("off", forKey: "sound")
        } else {
            soundButton.setImage(UIImage(named: "sound"), for: .normal)
            AudioManager.shared.unmuteBGM()
            UserDefaults.standard.setValue("on", forKey: "sound")
        }
    }
    
    private func setUpSubviews() {
        view.subviews {
            backgroundImageView
            titleLabel
            monsterImageView
            leftStackView
            rightStackView
            leaderboardLabel
            helpButton
            helpLabel
            startButton
        }
        
        backgroundImageView.fillContainer()
    
        titleLabel.top(4%)
        titleLabel.CenterX == view.CenterX
        
        monsterImageView.Top == titleLabel.Bottom + 30
        monsterImageView.CenterX == view.CenterX
        monsterImageView.width(175)
        monsterImageView.height(175)
        
        leftStackView.addArrangedSubview(likeButton)
        leftStackView.setCustomSpacing(0, after: likeButton)
        leftStackView.addArrangedSubview(likeLabel)
        leftStackView.addArrangedSubview(moreButton)
        leftStackView.setCustomSpacing(0, after: moreButton)
        leftStackView.addArrangedSubview(moreLabel)
        leftStackView.addArrangedSubview(soundButton)
        leftStackView.setCustomSpacing(0, after: soundButton)
        leftStackView.addArrangedSubview(soundLabel)

        leftStackView.Top == monsterImageView.Top + 10
        leftStackView.Left == view.Left + 15
        
        likeButton.width(65)
        likeButton.height(65)
        
        moreButton.width(65)
        moreButton.height(65)
        
        soundButton.width(65)
        soundButton.height(65)
        
        rightStackView.addArrangedSubview(rateButton)
        rightStackView.setCustomSpacing(0, after: rateButton)
        rightStackView.addArrangedSubview(rateLabel)
        rightStackView.addArrangedSubview(leaderboardButton)
        rightStackView.setCustomSpacing(28, after: leaderboardButton)
        rightStackView.addArrangedSubview(noAdsButton)
        
        rightStackView.Top == monsterImageView.Top + 10
        rightStackView.Right == view.Right - 15
        
        rateButton.width(65)
        rateButton.height(65)
        
        leaderboardButton.width(65)
        leaderboardButton.height(65)
        
        noAdsButton.width(65)
        noAdsButton.height(65)
        
        leaderboardLabel.Top == leaderboardButton.Bottom
        leaderboardLabel.CenterX == leaderboardButton.CenterX
        
        helpButton.CenterX == view.CenterX
        helpButton.CenterY == soundButton.CenterY
        
        helpButton.width(65)
        helpButton.height(65)
        
        helpLabel.Top == helpButton.Bottom
        helpLabel.CenterX == view.CenterX
        
        startButton.Bottom == view.safeAreaLayoutGuide.Bottom - 50
        startButton.CenterX == view.CenterX
    }
    
    private func styleSubviews() {
        backgroundImageView.image = UIImage(named: "background")
        
        titleLabel.text = "STUPID\nTEST"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "dosis-bold", size: 70)
        
        monsterImageView.image = UIImage(named: "monster")
        
        leftStackView.axis = .vertical
        leftStackView.spacing = 10
        
        likeButton.setImage(UIImage(named: "facebook"), for: .normal)
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        
        if UserDefaults.standard.string(forKey: "sound") == "on" || UserDefaults.standard.string(forKey: "sound") == nil {
            soundButton.setImage(UIImage(named: "sound"), for: .normal)
        } else {
            soundButton.setImage(UIImage(named: "mute"), for: .normal)
        }
        
        likeLabel.text = "LIKE US"
        likeLabel.textAlignment = .center
        likeLabel.font = UIFont(name: "dosis-bold", size: 12)
        
        moreLabel.text = "MORE APPS"
        moreLabel.textAlignment = .center
        moreLabel.font = UIFont(name: "dosis-bold", size: 12)
        
        soundLabel.text = "SOUND"
        soundLabel.textAlignment = .center
        soundLabel.font = UIFont(name: "dosis-bold", size: 12)
        
        rightStackView.axis = .vertical
        rightStackView.spacing = 10
        
        rateButton.setImage(UIImage(named: "star"), for: .normal)
        leaderboardButton.setImage(UIImage(named: "leaderboard"), for: .normal)
        noAdsButton.setImage(UIImage(named: "no ads"), for: .normal)
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
            UIView.animate(withDuration: 0.25, animations: {
                self.rateButton.frame.origin.y -= 20
            }) { _ in
                UIView.animate(withDuration: 0.25, animations: {
                    self.rateButton.frame.origin.y += 20
                }) { _ in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.rateButton.frame.origin.y -= 20
                    }) { _ in
                        UIView.animate(withDuration: 0.25, animations: {
                            self.rateButton.frame.origin.y += 20
                        })
                    }
                }
            }
        }
        
        rateLabel.text = "RATE APP"
        rateLabel.textAlignment = .center
        rateLabel.font = UIFont(name: "dosis-bold", size: 12)
        
        leaderboardLabel.text = "LEADERBOARDS"
        leaderboardLabel.textAlignment = .center
        leaderboardLabel.font = UIFont(name: "dosis-bold", size: 12)
        
        helpButton.setImage(UIImage(named: "help"), for: .normal)
        
        helpLabel.text = "HELP"
        helpLabel.textAlignment = .center
        helpLabel.font = UIFont(name: "dosis-bold", size: 12)
        
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "dosis-bold", size: 70)
    }
}
