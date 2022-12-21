//
//  SearchSongsPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 21.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchSongViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ app: ITunesSong)
}

class SearchSongsPresenter {
    // MARK: - Private Properties
    
    weak var viewInput: (UIViewController & SearchSongViewInput)?
    private let searchService = ITunesSearchService()
    // MARK: - Private functions
    
    private func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.viewInput?.throbber(show: false)
            result.withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            } .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }
}

extension SearchSongsPresenter: SearchSongViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ app: ITunesSong) {
    }
}
