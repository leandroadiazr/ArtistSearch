//
//  ResultsCell.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import UIKit

class ResultsCell: UITableViewCell {
    
    static let reuseID      = "ResultsCell"
    var artistLabel         = CustomLabel(textAlignment: .left, fontSize: 12)
    var trackLabel          = CustomLabel(textAlignment: .left, fontSize: 12)
    var genreLabel          = CustomLabel(textAlignment: .left, fontSize: 12)
    var releaseLabel        = CustomLabel(textAlignment: .left, fontSize: 12)
    var priceLabel          = CustomLabel(textAlignment: .left, fontSize: 12)
    
    var artistName          = CustomLabel(textAlignment: .left, fontSize: 12)
    var trackName           = CustomLabel(textAlignment: .left, fontSize: 12)
    var primaryGenreName    = CustomLabel(textAlignment: .left, fontSize: 12)
    var releaseDate         = CustomLabel(textAlignment: .left, fontSize: 12)
    var trackPrice          = CustomLabel(textAlignment: .left, fontSize: 12)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setArtistCell(with artist: Artist) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateString = formatter.string(from: artist.releaseDate)
        
        artistName.text = artist.artistName
        trackName.text = artist.trackName
        primaryGenreName.text = artist.primaryGenreName
        releaseDate.text    =  dateString
        trackPrice.text     = "$\(artist.trackPrice ?? 0.0)"
    }
    
    private func configure() {
        backgroundColor = randomColor()
        artistLabel.text    = "Artist Name: "
        trackLabel.text     = "Track Name: "
        genreLabel.text     = "Genre :"
        releaseLabel.text   = "Release Date :"
        priceLabel.text     = "Track Price :"
        
        let labels = [artistLabel, artistName, trackLabel, trackName, genreLabel,
                      primaryGenreName, releaseLabel, releaseDate, priceLabel,
                      trackPrice]
        
        for label in labels {
            label.textColor = .white
            addSubview(label)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 5
        let minPadding: CGFloat = 2
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            artistLabel.widthAnchor.constraint(equalToConstant: 100),
            
            artistName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            artistName.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: padding),
            artistName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            trackLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: minPadding),
            trackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            trackLabel.widthAnchor.constraint(equalToConstant: 100),
            
            trackName.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: minPadding),
            trackName.leadingAnchor.constraint(equalTo: trackLabel.trailingAnchor, constant: padding),
            trackName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            genreLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: minPadding),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            genreLabel.widthAnchor.constraint(equalToConstant: 100),
            
            primaryGenreName.topAnchor.constraint(equalTo: trackName.bottomAnchor, constant: minPadding),
            primaryGenreName.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: padding),
            primaryGenreName.widthAnchor.constraint(equalToConstant: 100),
            
            releaseLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: minPadding),
            releaseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            releaseLabel.widthAnchor.constraint(equalToConstant: 100),
            
            releaseDate.topAnchor.constraint(equalTo: primaryGenreName.bottomAnchor, constant: minPadding),
            releaseDate.leadingAnchor.constraint(equalTo: releaseLabel.trailingAnchor, constant: padding),
            
            priceLabel.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: minPadding),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
            
            trackPrice.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: minPadding),
            trackPrice.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: padding),
            trackPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
    }
}
