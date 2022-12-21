//
//  AppUpdateView.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 20.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppUpdateView: UIView {
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Что нового"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.text = "История версий"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        return label
    }()
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    // MARK: - UI
    
    private func setupLayout() {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(historyLabel)
        self.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            versionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            
            descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 12),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            historyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            timeLabel.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 12),
            timeLabel.rightAnchor
                .constraint(equalTo: rightAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -12)
        ])
    }
}
