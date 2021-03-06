//
//  NumberedWorkoutViewController.swift
//  Ghosting Connector
//
//  Created by Varun Chitturi on 6/10/20.
//  Copyright © 2020 Squash Dev. All rights reserved.
//

import UIKit
import CoreBluetooth
class ChooseNumberWorkoutAttributesViewController: UIViewController, UITextFieldDelegate {
    var isRandomized = true
	@IBOutlet weak var setsField: UITextField!
	@IBOutlet weak var ghostsField: UITextField!
	@IBOutlet weak var secondsOff: UITextField!
	@IBOutlet weak var minutesOff: UITextField!
	@IBOutlet var blankRandomize: UIButton!
	@IBOutlet weak var choosPatternButton: UIButton!
	@IBOutlet var randomizeButton: UIButton!
	@IBAction func unRandomize(_ sender: Any) {
		let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
		impactFeedbackgenerator.prepare()
		impactFeedbackgenerator.impactOccurred()
        isRandomized = true
        blankRandomize.isHidden = true
        randomizeButton.isHidden = false
        print(isRandomized)
    }
	@IBAction func setFieldSelected(_ sender: Any) {
		if ghostsField.text == ""{
			ghostsField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if minutesOff.text == ""{
			minutesOff.text = "0"
		}
		if secondsOff.text == ""{
			secondsOff.text = "0"
		}
		setsField.text = ""
	}
	@IBAction func ghostFieldSelected(_ sender: Any) {
		if ghostsField.text == ""{
			ghostsField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if minutesOff.text == ""{
			minutesOff.text = "0"
		}
		if secondsOff.text == ""{
			secondsOff.text = "0"
		}
		ghostsField.text = ""
	}
	@IBAction func minutesOffFieldSelected(_ sender: Any) {
		if ghostsField.text == ""{
			ghostsField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if minutesOff.text == ""{
			minutesOff.text = "0"
		}
		if secondsOff.text == ""{
			secondsOff.text = "0"
		}
		minutesOff.text = ""
	}
	@IBAction func secondsOffFieldSelected(_ sender: Any) {
		if ghostsField.text == ""{
			ghostsField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if minutesOff.text == ""{
			minutesOff.text = "0"
		}
		if secondsOff.text == ""{
			secondsOff.text = "0"
		}
		secondsOff.text = ""
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
		if ghostsField.text == ""{
			ghostsField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if minutesOff.text == ""{
			minutesOff.text = "0"
		}
		if secondsOff.text == ""{
			secondsOff.text = "0"
		}
	}
    @IBAction func randomize(_ sender: Any) {
		let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
		impactFeedbackgenerator.prepare()
		impactFeedbackgenerator.impactOccurred()
        isRandomized = false
        blankRandomize.isHidden = false
        randomizeButton.isHidden = true
        print(isRandomized)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        blankRandomize.isHidden = true
		choosPatternButton.imageView?.contentMode = .redraw
		randomizeButton.imageView?.contentMode = .redraw
		blankRandomize.imageView?.contentMode = .redraw
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
	@objc func keyboardWillHide(notification: NSNotification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
		if ghostsField.text == ""{
			ghostsField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if minutesOff.text == ""{
			minutesOff.text = "0"
		}
		if secondsOff.text == ""{
			secondsOff.text = "0"
		}
	}
	@objc func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				self.view.frame.origin.y -= (keyboardSize.height - 170)
			}
		}
	}
	@IBAction func choosePattern(_ sender: Any) {
		if(((secondsOff.text! as NSString).integerValue) < 60 && ((secondsOff.text! as NSString).integerValue) >= 0 && ((minutesOff.text! as NSString).integerValue) < 60 && ((minutesOff.text! as NSString).integerValue) >= 0 && secondsOff.text! != "" && minutesOff.text! != "" && setsField.text != "" && setsField.text != "0" && ghostsField.text != "0" && (secondsOff.text != "0" || minutesOff.text != "0")){
			performSegue(withIdentifier: "ChooseNumberWorkoutPatternViewControllerSegue", sender: nil)
		}
		else if((setsField.text! as NSString).integerValue > 9999 || (ghostsField.text! as NSString).integerValue > 9999){
			let alertVC = UIAlertController(title: "Values too large", message: "Your ghosts or sets values are too large.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
		else if (ghostsField.text == "0" || setsField.text == "0"){
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your number of sets and ghosts are not equal to 0.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
		else if( (((secondsOff.text! as NSString).integerValue) == 0 && ((minutesOff.text! as NSString).integerValue == 0))){
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your rest time is not equal to 0 minutes and 0 seconds.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
		else{
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your minutes and seconds are between 0 and 59.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
	}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ChooseNumberWorkoutPatternViewControllerSegue" {
			if let childVC = segue.destination as? ChooseNumberWorkoutPatternViewController {
				childVC.numSets = (setsField.text! as NSString).integerValue
				childVC.numGhosts = (ghostsField.text! as NSString).integerValue
				childVC.isRandomized = isRandomized
				childVC.minutesOff = (minutesOff.text! as NSString).integerValue
				childVC.secondsOff = (secondsOff.text! as NSString).integerValue
			}
		}
    }
}
