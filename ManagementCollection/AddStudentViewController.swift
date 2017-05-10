//
//  AddStudentViewController.swift
//  ManagementCollection
//
//  Created by Cntt20 on 5/10/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    //
    @IBOutlet weak var nameStudent: UITextField!
    @IBOutlet weak var nameUniversity: UITextField!
    @IBOutlet weak var oldYear: UITextField!
    @IBOutlet weak var descrip: UITextField!
    //
    var studentList: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        oldYear.keyboardType = UIKeyboardType.decimalPad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    
    @IBAction func addStudent(_ sender: UIButton) {
        if nameStudent.text!.isEmpty || nameUniversity.text!.isEmpty || oldYear.text!.isEmpty || descrip.text!.isEmpty {
            // Thong bao nhap thieu thong tin
            let alert = UIAlertController(title: "Error", message: "Missing Information!", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }
        else {
            TempStudent.check = true
            let student: Student = Student(name: nameStudent.text!, university: nameUniversity.text!, oldYear: Int(oldYear.text!)!, description: descrip.text!)
            TempStudent.student = student
            self.navigationController?.popViewController(animated: true)
        }

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
