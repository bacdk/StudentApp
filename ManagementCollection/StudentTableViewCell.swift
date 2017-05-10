//
//  StudentTableViewCell.swift
//  ManagementCollection
//
//  Created by Cntt20 on 5/10/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    //
    @IBOutlet weak var nameStudentLabel: UILabel!
    @IBOutlet weak var nameUniversityLabel: UILabel!
    //

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //
    func configureStudentViewCell(student: Student) {
        self.nameStudentLabel.text = student.name
        self.nameUniversityLabel.text = student.university
    }

}
