//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 21.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    //MARK: - Subviews
    
    private(set) var coverImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private(set) var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.coverImageView.image = UIImage(named: "Music")
        self.titleLabel.text = cellModel.title
        self.subtitleLabel.text = cellModel.subtitle
    }
    // MARK: - UI
    
    private func configureUI() {
        self.addCoverImageView()
        self.addTitleLabel()
        self.addSubtitleLabel()
    }
    
    func addCoverImageView() {
        self.contentView.addSubview(self.coverImageView)
        NSLayoutConstraint.activate([
            
            self.coverImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            self.coverImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.coverImageView.widthAnchor.constraint(equalToConstant: 40),
            self.coverImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20.0)
        ])
    }
    
    func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 12.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20.0)
        ])
    }
}
