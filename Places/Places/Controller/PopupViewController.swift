//
//  PopUpViewController.swift
//  Places
//
//  Created by mohamdan on 29/07/2023.
//

import UIKit
import RealmSwift

class PopupViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveConfirmed(_ sender: UIButton) {
        dismiss(animated: true)
        let newLandMark = Landmark()
        newLandMark.name = nameTextField.text!
        newLandMark.desc = descTextView.text!
        newLandMark.lat = Places.shared.userLat
        newLandMark.lon = Places.shared.userLon
        try! realm.write{
            realm.add(newLandMark)
        }
    }
}
