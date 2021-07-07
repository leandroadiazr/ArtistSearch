//
//  ResultsViewController.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var artistName: String?
    var tableView: UITableView?
    var artist: [Artist] = []
    
    init(artistName: String) {
        super.init(nibName: nil, bundle: nil)
        self.artistName = artistName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        guard let artist = artistName else { return }
        getArtist(artistName: artist)
    }
    
    private func configureTableView() {
        title = "Artist Search Results"
        tableView = UITableView(frame: .zero, style: .plain)
        tableView?.frame = view.bounds
        tableView?.register(ResultsCell.self, forCellReuseIdentifier: ResultsCell.reuseID)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 90
        
        guard let tableView = tableView else { return}
        view.addSubview(tableView)
    }
    
    func getArtist(artistName: String) {
        showLoadingView()
        NetworkManager.shared.getArtist(for: artistName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let results):
                guard let artistResult = results else { return }
                
                if artistResult.count == 0 {
                    self.showAlert(title: Helpers.noMatch, message: Helpers.pleaseCheck)
                }
                self.artist.append(contentsOf: artistResult)
                
                DispatchQueue.main.async {
                    guard let tableView = self.tableView else { return }
                    tableView.reloadData()
                    self.view.bringSubviewToFront(tableView)
                }
                self.dismissLoadingView()
            case .failure(_):
                self.showAlert(title: Helpers.noMatch, message: Helpers.pleaseCheck)
            }
        }
    }
}


extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultsCell.reuseID, for: indexPath) as! ResultsCell
        let item = artist[indexPath.row]
        cell.setArtistCell(with: item)
        return cell
    }
}



