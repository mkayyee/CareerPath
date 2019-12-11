//
//  AlertViewController.swift
//  Career Path
//
//  Created by Oona on 24/11/2019.
//  Copyright © 2019 Team Awesome. All rights reserved.
//

import UIKit

// Controller for alerts

class AlertViewController: UIViewController {
    
    @IBAction func cancelButton(_ sender: RoundButton) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var topBar: UIView!
    
    var alertBody = String()
    
    func setupView() {
        body.text = alertBody
        topBar.backgroundColor = UIColor.sortingButtons(theme: .t9)
        containerView.layer.cornerRadius = 15;
        containerView.layer.masksToBounds = true;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
}

