//
//  ViewController.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel          = CustomLabel(textAlignment: .center, fontSize: 45)
    var informationLabel    = CustomLabel(textAlignment: .center, fontSize: 15)
    var searchTextField     = CustomTextField()
    let searchBtn           = CustomButton(backgroundColor: .systemBlue, title: "Search Artist")
    var isSearchTextEmpty          : Bool { return !searchTextField.text!.isEmpty}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        searchTextField.delegate = self
        view.backgroundColor        = .systemBackground
        titleLabel.text             = Helpers.title
        view.addSubview(titleLabel)
        informationLabel.text       = Helpers.displayInfo
        view.addSubview(informationLabel)
        view.addSubview(searchTextField)
        view.addSubview(searchBtn)
        
        setupConstraints()
        setupActionBtn()
    }
    
    private func setupActionBtn() {
        searchBtn.addTarget(self, action: #selector(getArtistData), for: .touchUpInside)
    }
    
    @objc private func getArtistData() {
        guard isSearchTextEmpty else {
            self.showAlert(title: Helpers.empty, message: Helpers.pleaseEnter)
            return
        }
        
        searchTextField.resignFirstResponder()
        let resultsVC = ResultsViewController(artistName: searchTextField.text!)
        navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        let topPading: CGFloat = 70
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: topPading + 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: topPading),
            informationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            informationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            informationLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: topPading),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.widthAnchor.constraint(equalToConstant: 225),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchBtn.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: padding),
            searchBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBtn.widthAnchor.constraint(equalToConstant: 150),
            searchBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getArtistData()
        return true
    }
}

