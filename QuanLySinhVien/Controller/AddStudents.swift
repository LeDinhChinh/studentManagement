//
//  ViewController.swift
//  QuanLySinhVien
//
//  Created by Admin on 1/15/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddStudents: UIViewController, UITextFieldDelegate {
    var arrStudents: [Students] = []
    
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var IDTextField: UITextField!
    @IBOutlet weak private var phoneNumberTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var CTextField: UITextField!
    @IBOutlet weak private var CDotDotTextField: UITextField!
    @IBOutlet weak private var JavaTextField: UITextField!
    @IBOutlet weak private var SwiftTextField: UITextField!
    @IBOutlet weak private var IOSTextField: UITextField!
    
    @IBAction func submitBtn(_ sender: Any) {
        guard let name = nameTextField.text,
            let id = IDTextField.text,
            let phone = phoneNumberTextField.text,
            let email = emailTextField.text,
            let scoreC = CTextField.text,
            let scoreCDotDot = CDotDotTextField.text,
            let scoreJava = JavaTextField.text,
            let scoreSwift = SwiftTextField.text,
            let scoreIOS = IOSTextField.text else {
                print("Information student is nil")
                return
        }
        
        let student: Students = Students(name, id, phone, email, scoreC, scoreCDotDot, scoreJava, scoreSwift, scoreIOS)
        DataLocal.insertRecore(name, id, phone, email, scoreC, scoreCDotDot, scoreJava, scoreSwift, scoreIOS)
        arrStudents.append(student)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "bg") {
            view.backgroundColor = UIColor(patternImage: image)
        }
        arrStudents = DataLocal.getDataStudents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? listStudents {
            destination.arrStudents = arrStudents
        }
    }
    
}
