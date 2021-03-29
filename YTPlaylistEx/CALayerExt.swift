//
//  CALayerExt.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/28.
//

import UIKit

extension CALayer {
    @available(*, unavailable, message: "Only use it at Storybord or Xib.", renamed: "borderColor")
    @IBInspectable var borderUIColor: UIColor? {
        get { return borderColor.map { UIColor(cgColor: $0) } }
        set { borderColor = newValue?.cgColor }
    }
    
    @available(*, unavailable, message: "Only use it at Storybord or Xib.", renamed: "shadowColor")
    @IBInspectable var shadowUIColor: UIColor? {
        get { return shadowColor.map { UIColor(cgColor: $0) } }
        set { shadowColor = newValue?.cgColor }
    }
    
    @available(*, unavailable, message: "Only use it at Storybord or Xib.", renamed: "cornerRadius")
    @IBInspectable var cornerRadiusRatio: CGFloat {
        get { return cornerRadius / frame.height }
        set { cornerRadius = frame.height * newValue }
    }
}
