//
//  Utilities.swift
//  ArtistSearch
//
//  Created by Leandro Diaz on 7/6/21.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        UIView.animate(withDuration: 0.5) { containerView.alpha = 0.8 }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.modalPresentationStyle    = .overFullScreen
            alert.modalTransitionStyle      = .crossDissolve
            alert.addAction(UIAlertAction(title: Helpers.ok, style: .default, handler: nil))
            
            self.present(alert, animated: true)
            self.dismissAlert()
        }
    }
    
    private func dismissAlert(){
        dismiss(animated: true)
    }
}

extension UITableViewCell {
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 0.8)
    }
}

