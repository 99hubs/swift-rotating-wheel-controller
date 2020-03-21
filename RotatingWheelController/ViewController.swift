//
//  ViewController.swift
//  RotatingWheelController
//
//  Created by tom on 12/11/18.
//  Copyright © 2018 tom. All rights reserved.
//

import os
import UIKit

class ViewController: UIViewController {
	
	
	
	
	@IBOutlet weak var daysLabel: UILabel!
	@IBOutlet weak var wheelContainer: UIView!
	@IBOutlet weak var moreDaysButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let wheel = SMRotaryWheel(frame: CGRect(x: 0, y: 0, width: wheelContainer.bounds.width, height: wheelContainer.bounds.height), delegate: self, numberOfSections: 24)
        
		// Put it in the wheel container
		wheelContainer.addSubview(wheel)
		
		
		
    }
}

extension ViewController : SMRotaryProtocol {
	func viewFor(tag: Int, minimumValue: Int, multiplier: Int) -> UIView {
        let view = UILabel(frame: CGRect(x: 0, y: 0, width: wheelContainer.bounds.width/2-14, height: 40))
        view.tag = tag + minimumValue
        view.text = "\(tag + minimumValue)"
		view.font = view.font.withSize(12)
		view.textColor = UIColor(named: "blackBackground")
        return view
    }

    func wheelDidChangeValue(to: Int) {
		daysLabel.text = "\(to) days"
		
		//moreDaysButton.frame.origin.y+=10
    }
}

