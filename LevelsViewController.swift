//
//  LevelsViewController.swift
//  Stupid Test
//
//  Created by Chris Park on 1/16/21.
//

import Hero
import Stevia
import UIKit

struct Level {
    var number: Int
    var isLocked: Bool
    
    init(number: Int, isLocked: Bool) {
        self.number = number
        self.isLocked = isLocked
    }
}

class LevelsViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let titleLabel = UILabel()
    let homeButton = UIButton()
    let levelsTableView = UITableView()
    let downImageView = UIImageView()
    
    var levels: [Level] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        styleSubviews()
        addButtonActions()
        for i in 0..<30 {
            if i == 0 {
                levels.append(Level(number: i + 1, isLocked: false))
            } else {
                levels.append(Level(number: i + 1, isLocked: true))
            }
        }
    }
    
    private func addButtonActions() {
        homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func homeButtonTapped() {
        hero.modalAnimationType = .selectBy(presenting:.push(direction: .left), dismissing:.pull(direction: .right))
        hero.dismissViewController()
    }
    
    private func setUpSubviews() {
        view.subviews {
            backgroundImageView
            titleLabel
            homeButton
            levelsTableView
            downImageView
        }
        
        backgroundImageView.fillContainer()
        
        titleLabel.Top == view.safeAreaLayoutGuide.Top + 35
        titleLabel.CenterX == view.CenterX
        
        homeButton.Top == view.safeAreaLayoutGuide.Top + 2
        homeButton.Right == view.Right - 3
        homeButton.width(50)
        homeButton.height(50)
        
        levelsTableView.Top == titleLabel.Bottom + 10
        levelsTableView.Left == view.Left
        levelsTableView.Right == view.Right
        levelsTableView.Bottom == view.safeAreaLayoutGuide.Bottom
        
        downImageView.Bottom == view.safeAreaLayoutGuide.Bottom - 5
        downImageView.CenterX == view.CenterX
        downImageView.width(90)
        downImageView.height(35)
    }
    
    private func styleSubviews() {
        backgroundImageView.image = UIImage(named: "background")
        
        titleLabel.text = "SELECT LEVEL:"
        titleLabel.font = UIFont(name: "dosis-bold", size: 45)
        
        homeButton.setImage(UIImage(named: "house"), for: .normal)
        
        levelsTableView.register(LevelsTableViewCell.self, forCellReuseIdentifier: "cellId")
        levelsTableView.delegate = self
        levelsTableView.dataSource = self
        levelsTableView.backgroundColor = .clear
        levelsTableView.separatorColor = .clear
        levelsTableView.showsVerticalScrollIndicator = false
        
        downImageView.image = UIImage(named: "down")
        downImageView.alpha = 0.7
    }
}

extension LevelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! LevelsTableViewCell
        cell.selectionStyle = .none
        cell.level = levels[indexPath.row]
        if !levels[indexPath.row].isLocked {
            cell.lockImageView.isHidden = true
        } else {
            cell.lockImageView.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if levels[indexPath.row].number == 1 {
            let gameplayViewController = GameplayViewController()
            gameplayViewController.modalPresentationStyle = .fullScreen
            gameplayViewController.hero.isEnabled = true
            gameplayViewController.hero.modalAnimationType = .push(direction: .left)
            present(gameplayViewController, animated: true, completion: nil)
        }
    }
}
