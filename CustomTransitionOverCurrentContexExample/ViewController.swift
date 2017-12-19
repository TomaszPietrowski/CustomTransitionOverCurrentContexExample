//
//  ViewController.swift
//  CustomTransitionOverCurrentContexExample
//
//  Created by Tomasz Pietrowski on 18.12.2017.
//  Copyright © 2017 Tomasz Pietrowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private let button = UIButton()
    private let customTransition = ButtonTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupButton()
    }

    private func setupButton() {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0),
            button.heightAnchor.constraint(equalToConstant: 50.0),
            button.widthAnchor.constraint(equalTo: button.heightAnchor)
        ])
        
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        let viewController = SecondViewController()
        viewController.transitioningDelegate = self
        viewController.modalPresentationStyle = .overCurrentContext
        
        present(viewController, animated: true, completion: nil)
    }
    
    //MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customTransition
    }
}
