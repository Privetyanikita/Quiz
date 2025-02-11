//
//  ViewController.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 09.02.25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private let supportingImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "questionmark")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        element.contentMode = .scaleToFill
        element.isUserInteractionEnabled = true
        return element
    }()
    
    private let titleScreenLabel: UILabel = {
        let element = UILabel()
        element.textAlignment = .center
        element.text = "Правильных ответов".uppercased()
        element.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        element.textColor = .black
        return element
    }()
    
    private let progressView = CircularProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        progressView.setProgress(valueTrueAntworted: 40, animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(red: 248/255, green: 255/255, blue: 228, alpha: 1)
        view.add(subviews: progressView)
    }
}

extension MainViewController {
    private func setupConstrains() {
        
        progressView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }
}

