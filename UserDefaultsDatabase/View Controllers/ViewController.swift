//
//  ViewController.swift
//  UserDefaultsDatabase
//
//  Created by Mac on 04/10/21.
//
/*
 Program - Take name, contact and age from user Save it to userdefault database and display info from database.
 */

import UIKit

class ViewController: UIViewController {
    //
    //MARK: Outlets
    //
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.isHidden = true
        nameLabel.isHidden = true
        contactLabel.isHidden = true
        ageLabel.isHidden = true
    }
    
    private func getDataFromDatabase(){
        titleLabel.isHidden = false
        nameLabel.isHidden = false
        contactLabel.isHidden = false
        ageLabel.isHidden = false
        let age = UserDefaults.standard.value(forKey: "age") as? String
        ageLabel.text = age
        let name = UserDefaults.standard.value(forKey: "name") as? String
        nameLabel.text = name
        let num = UserDefaults.standard.value(forKey: "num") as? String
        contactLabel.text = num
    }
    
    private func showAlert(title: String, message: String,success: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if success {
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.getDataFromDatabase()
            }))
        } else {
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func BtnAction(_ sender: Any) {
        if nameTF.text?.isEmpty==true||numberTF.text?.isEmpty==true||ageTF.text?.isEmpty==true{
            showAlert(title: "Warning", message: "Enter all fields!!!", success: false)
        } else {
            UserDefaults.standard.set(nameTF.text, forKey: "name")
            UserDefaults.standard.set(numberTF.text, forKey: "num")
            UserDefaults.standard.set(ageTF.text, forKey: "age")
            showAlert(title: "Successfull", message: "Added to Database.", success: true)
        }
    }
}
