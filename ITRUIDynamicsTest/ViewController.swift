//
//  ViewController.swift
//  ITRUIDynamicsTest
//
//  Created by Homyakov, Ilya2 on 17/12/2018.
//  Copyright © 2018 Homyakov, Ilya2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func snapBehaviorSceneButtonTuchUpInside(_ sender: Any) {
        self.show(SnapBehaviorSceneViewController(), sender: sender)
    }
}

extension UIView { // FIXME: move
    class public func fromNib<T: UIView>() -> T {
        if let xib = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil),
            let result = xib.first as? T {
            return result
        }
        return T(frame: .zero)
    }
}

