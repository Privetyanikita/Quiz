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
        element.contentMode = .scaleAspectFit
        element.isUserInteractionEnabled = true
        return element
    }()
    
    private let titleScreenLabel: UILabel = {
        let element = UILabel()
        element.textAlignment = .center
        element.text = StringsData.MainView.correctAnswer.uppercased()
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
        view.backgroundColor = Colors.BacgroundViewColor
        view.add(subviews: supportingImageView, titleScreenLabel, progressView)
        progressView.progressLabel = 25
        title = StringsData.MainView.titleNavigation.uppercased()
    }
}

extension MainViewController {
    private func setupConstrains() {
        supportingImageView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(9)
            make.width.equalTo(25)
            make.height.equalTo(24)
        }
        
        titleScreenLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(26)
        }
        
        progressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleScreenLabel.snp.bottom).offset(26)
            make.width.height.equalTo(150)
        }
    }
}

