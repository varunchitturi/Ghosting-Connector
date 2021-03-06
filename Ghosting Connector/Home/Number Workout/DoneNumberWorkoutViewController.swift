//
//  DoneNumberedWorkoutViewController.swift
//  Ghosting Connector
//
//  Created by Varun Chitturi on 6/27/20.
//  Copyright © 2020 Squash Dev. All rights reserved.
//

import UIKit

class DoneNumberWorkoutViewController: UIViewController {
	var totalTimeOn : String!
	var avgTime : String!
	var totalGhosts : Int!
	var ghostedCorners : String!
	@IBOutlet weak var totalTimeOnLabel: UILabel!
	@IBOutlet weak var avgTimeperSet: UILabel!
	@IBOutlet weak var totalGhostsLabel: UILabel!
	@IBOutlet weak var ghostedCornersLabel: UILabel!
	@IBOutlet weak var doneButton: UIButton!
	override func viewDidLoad() {
        super.viewDidLoad()
		doneButton.imageView?.contentMode = .scaleAspectFit
		totalTimeOnLabel.text = totalTimeOn
		avgTimeperSet.text = avgTime
		totalGhostsLabel.text = String(totalGhosts)
		ghostedCornersLabel.text = ghostedCorners		
	}
	@IBAction func done(_ sender: Any) {
		popBack(5)
	}
	func popBack(_ nb: Int) {
		
		if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
			guard viewControllers.count < nb else {
				self.navigationController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
				return
			}
		}
	}
}
