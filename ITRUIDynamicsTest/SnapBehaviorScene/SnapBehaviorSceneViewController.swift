//
//  SnapBehaviorSceneViewController.swift
//  ITRUIDynamicsTest
//
//  Created by Homyakov, Ilya2 on 17/12/2018.
//  Copyright © 2018 Homyakov, Ilya2. All rights reserved.
//

import UIKit

class SnapBehaviorSceneViewController: UIViewController {
    @IBOutlet private weak var cardView: UIView!

    private var animator: UIDynamicAnimator?
    private var snapping: UISnapBehavior?

    public init() {
        super.init(nibName: "\(SnapBehaviorSceneViewController.self)", bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimator()
        setupCardView()
    }

    private func setupAnimator() {
        let animator = UIDynamicAnimator(referenceView: view)
        self.animator = animator
        let snapping = UISnapBehavior(item: cardView, snapTo: view.center)
        self.snapping = snapping
        animator.addBehavior(snapping)
    }

    private func setupCardView() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedCardView))
        cardView.addGestureRecognizer(panGesture)
        cardView.isUserInteractionEnabled = true
    }

    @objc
    private func pannedCardView(recognizer: UIPanGestureRecognizer) {
        guard let snapping = snapping else {
            return
        }
        switch recognizer.state {
        case .began:
            animator?.removeBehavior(snapping)
        case .changed:
            let translation = recognizer.translation(in: view)
            cardView.center = CGPoint(x: cardView.center.x + translation.x,
                                      y: cardView.center.y + translation.y)
            recognizer.setTranslation(.zero, in: view)
        case .ended, .cancelled, .failed:
            animator?.addBehavior(snapping)
        case .possible:
            break
        }
    }
}
