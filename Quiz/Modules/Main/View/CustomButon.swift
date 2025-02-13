//
//  CustomButon.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 11.02.25.
//

import UIKit

final class CustomButon: UIButton {
    private let titlLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        element.numberOfLines = 1
        return element
    }()
    
    private let backgroundView: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 16
        element.clipsToBounds = true
        element.isUserInteractionEnabled = false
        return element
    }()
    
    init(title: String, titleColor: UIColor, backgroundColor: UIColor, borderColor: UIColor) {
        super.init(frame: .zero)
        titlLabel.text = title
        titlLabel.textColor = titleColor
        backgroundView.backgroundColor = backgroundColor
        self.backgroundColor = borderColor
        self.layer.borderColor = borderColor.cgColor
        setupViews()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.add(subviews: backgroundView, titlLabel)
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
    }
    
}

extension CustomButon {
    func setupConstraint(){
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
        titlLabel.snp.makeConstraints { make in
            make.center.equalTo(backgroundView)
        }
    }
}
