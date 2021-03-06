//
//  EditSingularGoalViewController.swift
//  Ghosting Connector
//
//  Created by Varun Chitturi on 6/24/20.
//  Copyright © 2020 Squash Dev. All rights reserved.
//

import UIKit

class InitialEditGoalViewController: UIViewController {
	var editingGoal : Goal!
	var parentView : InitialMainViewGoalsViewController!
	@IBOutlet weak var applyChangesButton: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		applyChangesButton.imageView?.contentMode = .scaleAspectFit
		numGhostsField.text = String(editingGoal.ghosts)
		numSecondsField.text = String(editingGoal.seconds)
		numMinutesField.text = String(editingGoal.minutes)
		numSetsField.text = String(editingGoal.sets)
	}
	@objc func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				self.view.frame.origin.y -= (keyboardSize.height - 167)
			}
		}
	}
	@objc func keyboardWillHide(notification: NSNotification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
	}
	@IBOutlet weak var numSetsField: UITextField!
	@IBOutlet weak var numGhostsField: UITextField!
	@IBOutlet weak var numMinutesField: UITextField!
	@IBOutlet weak var numSecondsField: UITextField!
	@IBAction func setsFieldSelected(_ sender: Any) {
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
		numSetsField.text = ""
	}
	@IBAction func ghostsFieldSelected(_ sender: Any) {
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
		numGhostsField.text = ""
	}
	@IBAction func minutesFieldSelected(_ sender: Any) {
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
		numMinutesField.text = ""
	}
	@IBAction func secondsFieldSelected(_ sender: Any) {
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
		numSecondsField.text = ""
	}
	@IBAction func applyChanges(_ sender: Any) {
		if (((numSecondsField.text! as NSString).integerValue) < 60 && ((numSecondsField.text! as NSString).integerValue) >= 0 && ((numMinutesField.text! as NSString).integerValue) < 60 && ((numMinutesField.text! as NSString).integerValue) >= 0 && numMinutesField.text! != "" && numSecondsField.text! != "" && numGhostsField.text! != "" && numGhostsField.text! != "0" && numSetsField.text != "0" && numSetsField.text != ""){
			editingGoal.sets = Int64((numSetsField.text! as NSString).integerValue)
			editingGoal.seconds = Int64((numSecondsField.text! as NSString).integerValue)
			editingGoal.minutes = Int64((numSecondsField.text! as NSString).integerValue)
			editingGoal.ghosts = Int64((numGhostsField.text! as NSString).integerValue)
			self.dismiss(animated: true, completion: nil)
			self.dismiss(animated: true, completion: nil)
			parentView.childView?.tableView.reloadData()
		}
		else if (numSecondsField.text == "0" &&  numMinutesField.text == "0"){
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your rest time is not equal to 0 minutes and 0 seconds.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
		else{
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your minutes and seconds are between 0 and 59 and your ghosts and sets are greater than 0.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
	}
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
		if numGhostsField.text == ""{
			numGhostsField.text = "0"
		}
		if numMinutesField.text == ""{
			numMinutesField.text = "0"
		}
		if numSecondsField.text == ""{
			numSecondsField.text = "0"
		}
		if numSetsField.text == ""{
			numSetsField.text = "0"
		}
	}
	override func viewWillDisappear(_ animated: Bool) {
		parentView.childView?.tableView.reloadData()
	}
}
