//
//  AppUpdateViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 20.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppUpdateViewController: UIViewController {
    //MARK: - Properties
    
    private let app: ITunesApp
    private var appUpdateView: AppUpdateView {
        return self.view as! AppUpdateView
    }
    //MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppUpdateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    //MARK: - Private methods
    
    private func fillData() {
        appUpdateView.versionLabel.text = "Версия \(app.version)"
        appUpdateView.descriptionLabel.text = app.releaseNotes
        appUpdateView.timeLabel.text = String(app.releaseDate.prefix(10))
    }
}
