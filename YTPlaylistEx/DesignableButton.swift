//
//  DesignableButton.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/28.
//

import UIKit

// MARK: UIView
@available(*, unavailable, message: "Only use it at Storybord or Xib. When referring it from their file to Swift file, replace reference class name to inherited class.", renamed: "UIView")
@IBDesignable final class DesignableButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
