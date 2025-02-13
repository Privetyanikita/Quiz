//
//  CircularProgressView.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 09.02.25.
//

import UIKit
import SnapKit

final class CircularProgressView: UIView {
    
    private let progressLayer: CAShapeLayer = {
        let element = CAShapeLayer()
        element.fillColor = UIColor.clear.cgColor
        element.strokeColor = Colors.CircularProgress.RedColor.cgColor
        element.lineCap = .round
        element.strokeEnd = 0
        return element
    }()
    
    private let label: UILabel = {
        let element = UILabel()
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        element.textColor = .darkGray
        return element
    }()
    
    var progressLineWidth: CGFloat = 15 {
        didSet { updateLayers() }
    }
    
    var progressLabel: CGFloat = 16 {
        didSet { updateLayers() }
    }
    
    private(set) var progress: CGFloat = 0
    
    private(set) var progressTrueAnswer = 0 {
        didSet {
            updateProgress()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayers()
    }
    
    private func setupView() {
        [progressLayer].forEach { layer.addSublayer($0) }
        add(subviews: label)
    }
    
    private func updateLayers() {
        let size = min(bounds.width, bounds.height)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (size / 2) - (progressLineWidth / 2)
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: -CGFloat.pi / 2,
                                endAngle: 1.5 * CGFloat.pi,
                                clockwise: true).cgPath
        
        progressLayer.path = path
        progressLayer.lineWidth = progressLineWidth
        label.font = UIFont.systemFont(ofSize: progressLabel, weight: .bold)
    }
    
    private func updateProgress() {
        progressLayer.strokeEnd = progress
        label.text = "\(progressTrueAnswer)/50"
        updateStrokeColor()
    }
    
    func setProgress(valueTrueAntworted: Int, animated: Bool = true) {
        let valueCgFloat = CGFloat(valueTrueAntworted) / 50
        let clampedValue = min(max(valueCgFloat, 0), 1)
        if animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = progressLayer.strokeEnd
            animation.toValue = clampedValue
            animation.duration = 0.5
            progressLayer.add(animation, forKey: "progressAnim")
        }
        progress = clampedValue
        progressTrueAnswer = valueTrueAntworted
    }
    
    private func updateStrokeColor() {
        let newColor = colorForProgress(progressTrueAnswer).cgColor
        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.fromValue = progressLayer.strokeColor
        colorAnimation.toValue = newColor
        colorAnimation.duration = 0.3
        progressLayer.add(colorAnimation, forKey: "strokeColorAnimation")
        progressLayer.strokeColor = newColor
    }
    
    private func colorForProgress(_ value: Int) -> UIColor {
        switch value {
        case 0...20:
            return Colors.CircularProgress.RedColor
        case 21...35:
            return Colors.CircularProgress.OrangeColor
        case 36...50:
            return Colors.CircularProgress.GreenColor
        default:
            return Colors.CircularProgress.RedColor
        }
    }
}

extension CircularProgressView {
    private func setupConstrains() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
