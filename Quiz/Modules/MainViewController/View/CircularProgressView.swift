//
//  CircularProgressView.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 09.02.25.
//

import UIKit
import SnapKit

class CircularProgressView: UIView {
    
    private let progressLayer: CAShapeLayer = {
        let element = CAShapeLayer()
        element.path = UIBezierPath(arcCenter: CGPoint(x: 40, y: 40),
                                    radius: 36,
                                    startAngle: -CGFloat.pi / 2,
                                    endAngle: 1.5 * CGFloat.pi,
                                    clockwise: true).cgPath
        element.fillColor = UIColor.clear.cgColor
        element.lineWidth = 8
        element.lineCap = .round
        element.strokeEnd = 0
        return element
    }()
    
    private let trackLayer: CAShapeLayer = {
        let element = CAShapeLayer()
        element.path = UIBezierPath(arcCenter: CGPoint(x: 40, y: 40),
                                    radius: 36,
                                    startAngle: -CGFloat.pi / 2,
                                    endAngle: 1.5 * CGFloat.pi,
                                    clockwise: true).cgPath
        element.fillColor = UIColor.clear.cgColor
        element.lineWidth = 8
        element.lineCap = .round
        return element
    }()
    
    
    private let label: UILabel = {
        let element = UILabel()
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        element.textColor = .darkGray
        return element
    }()
    
    private(set) var progress: CGFloat = 0
    
    private var progressColor: UIColor = .red {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    private var trackColor: UIColor = UIColor.lightGray.withAlphaComponent(0.3) {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
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
        setupView()
    }
    
    private func setupView() {
        setupColorsForLayers()
        
        [trackLayer, progressLayer].forEach { layer.addSublayer($0) }
        add(subviews: label)
    }
    
    private func setupColorsForLayers() {
        trackLayer.strokeColor = trackColor.cgColor
        progressLayer.strokeColor = progressColor.cgColor
    }
    
    private func updateProgress() {
        progressLayer.strokeEnd = progress
        label.text = "\(progressTrueAnswer)/50"
    }
    
    func setProgress(valueTrueAntworted: Int, animated: Bool) {
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
}

extension CircularProgressView {
    private func setupConstrains() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
