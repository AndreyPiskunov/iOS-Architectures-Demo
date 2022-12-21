//
//  SearchSongBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 21.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchSongsBuilder {
     static func build() -> (UIViewController & SearchSongViewInput) {
         let presenter = SearchSongsPresenter()
         let viewController = SearchSongsVC(searchPresenter: presenter)
         presenter.viewInput = viewController
         return viewController
     }
 }
