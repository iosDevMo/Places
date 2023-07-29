//
//  PopUpViewController.swift
//  Places
//
//  Created by mohamdan on 29/07/2023.
//

import UIKit
import RealmSwift

class PopUpViewController: UIViewController {
    
    let realm = try! Realm()
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveConfirmed(_ sender: UIButton) {
        dismiss(animated: true)
        let newMark = Landmark()
        newMark.name = nameTextField.text!
        newMark.desc = descTextView.text
        
        try! realm.write{
            realm.add(newMark)
        }
        
       
    }
    

}
