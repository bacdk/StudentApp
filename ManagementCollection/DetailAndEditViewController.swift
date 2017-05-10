//
//  DetailAndEditViewController.swift
//  ManagementCollection
//
//  Created by Cntt20 on 5/10/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit

class DetailAndEditViewController: UIViewController {
    //
    @IBOutlet weak var nameStudent: UITextField!
    @IBOutlet weak var nameUniversity: UITextField!
    @IBOutlet weak var oldYear: UITextField!
    @IBOutlet weak var descrip: UITextField!
    //
    var student: Student?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStudent()
        oldYear.keyboardType = UIKeyboardType.decimalPad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    func configureStudent() {
        self.nameStudent.text = student?.name
        self.nameUniversity.text = student?.university
        self.descrip.text = student?.description
        if let x = student?.oldYear {
            self.oldYear.text = "\(x)"
        }
    }

    //
    @IBAction func saveEdit(_ sender: UIButton) {
        student?.name = nameStudent.text!
        student?.university = nameUniversity.text!
        student?.oldYear = Int(oldYear.text!)!
        student?.description = descrip.text!
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameStudent.resignFirstResponder()
        nameUniversity.resignFirstResponder()
        oldYear.resignFirstResponder()
        descrip.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
