//
//  SecondViewController.swift
//  CustomTransitionOverCurrentContexExample
//
//  Created by Tomasz Pietrowski on 19.12.2017.
//  Copyright © 2017 Tomasz Pietrowski. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
    }
    
    func setupContentView() {
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        contentView.backgroundColor = .red
    }
}
