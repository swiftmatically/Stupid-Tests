//
//  LevelsTableViewCell.swift
//  Stupid Test
//
//  Created by Chris Park on 1/16/21.
//

import Stevia
import UIKit

class LevelsTableViewCell: UITableViewCell {
    
    let levelLabel = UILabel()
    let lockImageView = UIImageView()
    
    var level: Level? {
        didSet {
            if let level = level {
                if !level.isLocked {
                    lockImageView.isHidden = true
                }
                levelLabel.text = "Level \(level.number)"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubviews()
        styleSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubviews() {
        subviews {
            levelLabel
            lockImageView
        }
        
        levelLabel.CenterX == CenterX
        levelLabel.CenterY == CenterY
        
        lockImageView.CenterX == CenterX
        lockImageView.CenterY == CenterY
        lockImageView.width(60)
        lockImageView.height(105)
    }
    
    private func styleSubviews() {
        backgroundColor = .clear
        
        levelLabel.text = "Level 1"
        levelLabel.font = UIFont(name: "dosis-medium", size: 43)
        
        lockImageView.image = UIImage(named: "lock")
        lockImageView.layer.zPosition = -1
    }
}
