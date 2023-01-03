//
// Created by Kayky Casagrande on 27/12/22.
//

import UIKit

class WaveView: UIView {
    enum Direction {
        case right
        case left
    }

    private weak var displayLink: CADisplayLink?
    private var startTime: CFTimeInterval = 0

    var speed: Double = 10 // 0 - static, 20 - very fast
    var frequency = 8.0
    var parameterA = 1.5
    var parameterB = 9.0
    var phase = 0.0

    var preferredColor = UIColor.tintColor

    // MARK: - Properties

    private let shapeLayer = CAShapeLayer()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let path = UIBezierPath()
        shapeLayer.frame = frame
        let width = Double(frame.width)
        let height = Double(frame.height)

        let mid = height * 0.5

        let waveLength = width / frequency
        let waveHeightCoef = Double(frequency)
        path.move(to: CGPoint(x: 0, y: frame.maxY))
        path.addLine(to: CGPoint(x: 0, y: mid))

        for x in stride(from: 0, through: width, by: 1) {
            let actualX = x / waveLength
            let sine = -cos(parameterA * (actualX + phase)) * sin((actualX + phase) / parameterB)
            let y = waveHeightCoef * sine + mid
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.addLine(to: CGPoint(x: CGFloat(width), y: frame.maxY))
        path.addLine(to: CGPoint(x: 0, y: frame.maxY))


        shapeLayer.path = path.cgPath
    }

    private func commonInit() {
        shapeLayer.fillColor = preferredColor.cgColor
        shapeLayer.strokeColor = preferredColor.cgColor
        layer.addSublayer(shapeLayer)
    }
}

