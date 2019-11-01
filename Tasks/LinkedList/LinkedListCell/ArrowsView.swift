//
//  ArrowsView.swift
//  Tasks
//
//  Created by Николай Спиридонов on 30.10.2019.
//  Copyright © 2019 Viter. All rights reserved.
//

import UIKit

class ArrowsView: UIView {
    override func draw(_ rect: CGRect) {
        let arrow = UIBezierPath()

        arrow.addArrow(start: CGPoint(x: 0, y: rect.height / 3),
                       end: CGPoint(x: rect.width, y: rect.height / 3),
                       pointerLineLength: rect.width / 5,
                       arrowAngle: CGFloat(Double.pi / 5))
        
        arrow.addArrow(start: CGPoint(x: rect.width, y: rect.height / 1.5),
                       end: CGPoint(x: 0, y: rect.height / 1.5),
                       pointerLineLength: rect.width / 5,
                       arrowAngle: CGFloat(Double.pi / 5))

        let arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = #colorLiteral(red: 0.8741769195, green: 0, blue: 0.08541091532, alpha: 0.9030126284)
        arrowLayer.lineWidth = 3
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(arrowLayer)
    }
}

