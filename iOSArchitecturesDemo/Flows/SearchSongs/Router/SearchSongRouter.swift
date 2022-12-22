//
//  SearchRouterInput.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 22.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    func openDetails(for song: ITunesSong)
}

class SearchSongRouter: SearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for song: ITunesSong) {
    }
}
