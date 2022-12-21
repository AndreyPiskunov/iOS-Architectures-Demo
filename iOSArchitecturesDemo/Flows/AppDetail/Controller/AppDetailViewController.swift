//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    // MARK: - Properties
    
    public var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var updateViewController = AppUpdateViewController(app: self.app)
    // MARK: - Construction
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    // MARK: - Private Functions
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.largeTitleDisplayMode = .never
        
        addHeaderViewController()
        addUpdateViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        self.view.addSubview(headerViewController.view)
        headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addUpdateViewController() {
        self.addChild(updateViewController)
        self.view.addSubview(updateViewController.view)
        updateViewController.didMove(toParent: self)
        
        updateViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            updateViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            updateViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            updateViewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
    
//    private func addDescriptionViewController() {
//
//        // TODO: ДЗ, сделать другие сабмодули
//
//        let descriptionViewController = UIViewController()
//        addChild(descriptionViewController)
//        view.addSubview(descriptionViewController.view)
//        descriptionViewController.didMove(toParent: self)
//
//        descriptionViewController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            descriptionViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
//            descriptionViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            descriptionViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            descriptionViewController.view.heightAnchor.constraint(equalToConstant: 250.0)
//        ])
//    }
//}
