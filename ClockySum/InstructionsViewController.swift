//
//  InstructionsViewController.swift
//  ClockySum
//
//  Created by Carson Carbery on 12/5/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    
    //MARK: IB Outlets
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var textLabelWidth: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidLayoutSubviews() {
        
        
        let viewWidth = mainView.frame.width
        textLabelWidth.constant = viewWidth - 48
        
    }
    
    @IBAction func closeAction(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    }
    
    
    
}
