//
//  TimedWorkoutViewController.swift
//  Ghosting Connector
//
//  Created by Varun Chitturi on 6/10/20.
//  Copyright © 2020 Squash Dev. All rights reserved.
//

import UIKit
import CoreBluetooth
class ChooseTimedWorkoutAttributesViewController: UIViewController, UITextFieldDelegate {
    var isRandomized = true
	@IBOutlet weak var choosePatternButton: UIButton!
	@IBOutlet var blankRandomize: UIButton!
	@IBOutlet var secondsField: UITextField!
	@IBOutlet var minutesField: UITextField!
	@IBOutlet weak var setsField: UITextField!
	@IBOutlet weak var minutesOffField: UITextField!
	@IBOutlet weak var secondsOffField: UITextField!
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
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
		setsField.text = ""
	}
	@IBAction func minutesFieldSelected(_ sender: Any) {
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
		minutesField.text = ""
	}
	@IBAction func secondFieldSelected(_ sender: Any) {
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
		secondsField.text = ""
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
	}
	@IBAction func minutesOffFieldSelected(_ sender: Any) {
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
		minutesOffField.text = ""
	}
	@IBAction func secondsOffFieldSelected(_ sender: Any) {
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
		secondsOffField.text = ""
	}
	@IBAction func choosePattern(_ sender: Any) {
		if(((secondsField.text! as NSString).integerValue) < 60 && ((secondsField.text! as NSString).integerValue) >= 0 && ((minutesField.text! as NSString).integerValue) < 60 && ((minutesField.text! as NSString).integerValue) >= 0 && secondsField.text! != "" && minutesField.text! != "" && setsField.text != "" && setsField.text != "0" && minutesOffField.text != "" && secondsOffField.text != ""  && ((secondsOffField.text! as NSString).integerValue) < 60 && ((secondsOffField.text! as NSString).integerValue) >= 0 && ((minutesOffField.text! as NSString).integerValue) < 60 && ((minutesOffField.text! as NSString).integerValue) >= 0 && (((secondsField.text! as NSString).integerValue) != 0 || ((minutesField.text! as NSString).integerValue != 0)) && (((secondsOffField.text! as NSString).integerValue) != 0 || ((minutesOffField.text! as NSString).integerValue != 0))){
			performSegue(withIdentifier: "ChooseTimedWorkoutPatternViewControllerSegue", sender: nil)
        }
		else if((setsField.text! as NSString).integerValue > 9999){
			let alertVC = UIAlertController(title: "Values too large", message: "Your sets value is to large.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
		else if (setsField.text! == "0"){
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your number of sets is not equal to 0.", preferredStyle: UIAlertController.Style.alert)
			let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) -> Void in
				alertVC.dismiss(animated: true, completion: nil)
			})
			alertVC.addAction(action)
			self.present(alertVC, animated: true, completion: nil)
		}
		else if( (((secondsField.text! as NSString).integerValue) == 0 && ((minutesField.text! as NSString).integerValue == 0)) || (((secondsOffField.text! as NSString).integerValue) == 0 && ((minutesOffField.text! as NSString).integerValue == 0)) ){
			let alertVC = UIAlertController(title: "Values not in range", message: "Make sure that your work time and rest time are not equal to 0 minutes and 0 seconds.", preferredStyle: UIAlertController.Style.alert)
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
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet var randomizeButton: UIButton!
	@IBAction func randomize(_ sender: Any) {
		let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
		impactFeedbackgenerator.prepare()
		impactFeedbackgenerator.impactOccurred()
		isRandomized = false
		blankRandomize.isHidden = false
		randomizeButton.isHidden = true
		print(isRandomized)
	}
	override func viewDidLoad() {
         super.viewDidLoad()
			choosePatternButton.imageView?.contentMode = .redraw
			randomizeButton.imageView?.contentMode = .redraw
			blankRandomize.imageView?.contentMode = .redraw
         blankRandomize.isHidden = true
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
     }
	@objc func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				self.view.frame.origin.y -= (keyboardSize.height - 170)
			}
		}
	}
	@objc func keyboardWillHide(notification: NSNotification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
		if minutesField.text == ""{
			minutesField.text = "0"
		}
		if setsField.text == ""{
			setsField.text = "0"
		}
		if secondsField.text == ""{
			secondsField.text = "0"
		}
		if secondsOffField.text == ""{
			secondsOffField.text = "0"
		}
		if minutesOffField.text == ""{
			minutesOffField.text = "0"
		}
	}
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseTimedWorkoutPatternViewControllerSegue" {
          if let childVC = segue.destination as? ChooseTimedWorkoutPatternViewController {
			childVC.numSets = (setsField.text! as NSString).integerValue
			childVC.onMinutes = (minutesField.text! as NSString).integerValue
			childVC.onSeconds = (secondsField.text! as NSString).integerValue
            childVC.isRandomized = isRandomized
			childVC.offMinutes = (minutesOffField.text! as NSString).integerValue
			childVC.offSeconds = (secondsOffField.text! as NSString).integerValue
          }
        }
    }
}
