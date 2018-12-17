//
//  UIView+Extension.swift
//  ITRUIDynamicsTest
//
//  Created by Homyakov, Ilya2 on 17/12/2018.
//  Copyright © 2018 Homyakov, Ilya2. All rights reserved.
//

import UIKit

extension UIView {
    class public func fromNib<T: UIView>() -> T {
        if let xib = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil),
            let result = xib.first as? T {
            return result
        }
        return T(frame: .zero)
    }
}
