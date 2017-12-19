//
//  ButtonTransition.swift
//  CustomTransitionOverCurrentContexExample
//
//  Created by Tomasz Pietrowski on 19.12.2017.
//  Copyright © 2017 Tomasz Pietrowski. All rights reserved.
//

import UIKit

class ButtonTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate let duration = 0.3
    fileprivate let squareView = UIView()
    
    private func setupSquareView(in view: UIView) {
        squareView.backgroundColor = .yellow
        squareView.frame = CGRect(
            x: view.frame.maxX - 70.0,
            y: view.frame.maxY - 70.0,
            width: 50.0,
            height: 50.0
        )
        view.addSubview(squareView)
    }
    
    private func addAnimation(viewSize: CGSize, completion: @escaping (Bool) -> Void) {
        UIView.animate(
            withDuration: duration,
            animations: {
                self.squareView.frame = CGRect(
                    x: 0.0,
                    y: 100.0,
                    width: viewSize.width,
                    height: viewSize.height - 100.0
                )
                self.squareView.backgroundColor = .red
            },
            completion: completion
        )
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        setupSquareView(in: containerView)
        addAnimation(viewSize: containerView.frame.size) { _ in
            containerView.addSubview(toViewController.view)
            transitionContext.completeTransition(true)
        }
    }
}
