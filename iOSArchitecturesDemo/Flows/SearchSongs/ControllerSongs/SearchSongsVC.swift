//
//  SearchSongVC.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey Piskunov on 21.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchSongsVC: UIViewController {
    //MARK: - Private properties
    
    private let searchPresenter: SearchSongViewOutput
    private var searchView: SearchSongsView {
        return self.view as! SearchSongsView
    }
    
    private let searchService = ITunesSearchService()
    internal var searchResults = [ITunesSong]() {
        didSet {
            searchView.tableView.isHidden = false
            searchView.tableView.reloadData()
            searchView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifire = "reuseIdSong"
    }
    //MARK: - Construction
    
    init(searchPresenter: SearchSongViewOutput) {
        self.searchPresenter = searchPresenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SearchSongsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
}

//MARK: - UITableViewDataSource
extension SearchSongsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath)
        
        guard let cell = dequeuedCell as? SongCell else {
            return dequeuedCell
        }
        
        let song = self.searchResults[indexPath.row]
        let cellModel = SongCellModelFactory.cellModel(from: song)
        cell.configure(with: cellModel)
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchSongsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = searchResults[indexPath.row]
        searchPresenter.viewDidSelectSong(song)
    }
}

//MARK: - UISearchBarDelegate
extension SearchSongsVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        
        self.searchPresenter.viewDidSearch(with: query)
    }
}

// MARK: - Input

extension SearchSongsVC: SearchSongViewInput {
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
