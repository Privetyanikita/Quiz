//
//  FlagCollectionViewCell.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 11.02.25.
//

import UIKit
import SnapKit

final class FlagCollectionViewCell: UICollectionViewCell {
    static let indetifier = "FlagCollectionViewCell"
    
    private let flagImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.add(subviews: flagImageView)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func configure(with flag: FlagsCountry) {
        flagImageView.image = flag.image
    }
}

extension FlagCollectionViewCell {
    private func setupConstraint() {
        flagImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
