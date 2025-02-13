//
//  ViewController.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 09.02.25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    //MARK: - Properties
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
    
    private let flagsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 18
        layout.minimumInteritemSpacing = 18
        layout.itemSize = CGSize(width: 74, height: 48)
        let element = UICollectionView(frame: .zero, collectionViewLayout: layout)
        element.backgroundColor = .clear
        element.register(FlagCollectionViewCell.self, forCellWithReuseIdentifier: FlagCollectionViewCell.indetifier)
        element.isScrollEnabled = false
        return element
    }()
    
    private let offlineButton = CustomButon(title: StringsData.MainView.titleButtonOffline.uppercased(),
                                            titleColor: .white,
                                            backgroundColor: Colors.ButtonsMainView.BlueColor,
                                            borderColor: Colors.ButtonsMainView.BlueBorderColor)
    
    private let onlineButton = CustomButon(title: StringsData.MainView.titleButtonOnline.uppercased(),
                                           titleColor: .black,
                                           backgroundColor: Colors.ButtonsMainView.WhiteColor,
                                           borderColor: Colors.ButtonsMainView.WhiteBorderColor)
    
    private let progressView = CircularProgressView()
    private var selectedIndexPath: IndexPath? = nil
    private let flags = [
        FlagsCountry(image: Icons.GermanyFlagIcon),
        FlagsCountry(image: Icons.UnitedKingdomFlagIcon),
        FlagsCountry(image: Icons.FranceFlagIcon),
        FlagsCountry(image: Icons.SpainFlagIcon)
    ]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        progressView.setProgress(valueTrueAntworted: 45, animated: true)
        selectedIndexPath = IndexPath(item: 0, section: 0)
        flagsCollectionView.reloadData()
    }
    //MARK: - Methods
    private func setupViews() {
        view.backgroundColor = Colors.BacgroundViewColor
        view.add(subviews: supportingImageView, titleScreenLabel, progressView, flagsCollectionView, offlineButton, onlineButton)
        progressView.progressLabel = 25
        title = StringsData.MainView.titleNavigation.uppercased()
        setupDelegates()
    }
    
    private func setupDelegates() {
        flagsCollectionView.delegate = self
        flagsCollectionView.dataSource = self
    }
}
//MARK: - SetupConstraints
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
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        progressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleScreenLabel.snp.bottom).offset(40)
            make.width.height.equalTo(150)
        }
        
        flagsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(170)
            make.height.equalTo(114)
        }
        
        onlineButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        offlineButton.snp.makeConstraints { make in
            make.bottom.equalTo(onlineButton.snp.top).inset(-20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagCollectionViewCell.indetifier, for: indexPath) as? FlagCollectionViewCell else { return UICollectionViewCell() }
        let isSelected = indexPath == selectedIndexPath
        cell.configure(with: flags[indexPath.row], isSelected: isSelected)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        var indexPathsToReload: [IndexPath] = [indexPath]
        if let previous = previousIndexPath, previous != indexPath {
            indexPathsToReload.append(previous)
        }
        collectionView.reloadItems(at: indexPathsToReload)
    }
}

