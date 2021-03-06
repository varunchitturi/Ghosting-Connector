//
//  ProWorkoutCheckPopupViewController.swift
//  Ghosting Connector
//
//  Created by Varun Chitturi on 7/11/20.
//  Copyright © 2020 Squash Dev. All rights reserved.
//

import UIKit
import M13Checkbox
class ProWorkoutCheckPopupViewController: UIViewController {
	@IBOutlet weak var checkBoxContainingView: UIView!
	@IBOutlet weak var checkBox: M13Checkbox!
	override func viewDidLoad() {
		super.viewDidLoad()
		checkBox.isEnabled = false
		checkBox.tintColor = UIColor(red: 26/256, green: 230/256, blue: 100/256, alpha: 1)
		checkBox.animationDuration = 1
		checkBox.checkmarkLineWidth = 5.0
		checkBox.boxLineWidth = 5.0
		let seconds = 1.5
		DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
			self.dismiss(animated: true, completion: nil)
		}
	}
	override func viewWillAppear(_ animated: Bool) {
		checkBoxContainingView.layer.cornerRadius = 30
		let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
		notificationFeedbackGenerator.prepare()
		notificationFeedbackGenerator.notificationOccurred(.success)
		checkBox.setCheckState(.checked, animated: true)
	}
}
