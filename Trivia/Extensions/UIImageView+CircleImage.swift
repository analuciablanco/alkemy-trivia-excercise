//
//  UIImageView+CircleImage.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 05/09/22.
//

import UIKit

extension UIImageView {
    func circleImage() {
        layer.cornerRadius = self.bounds.width / 2
    }
}
