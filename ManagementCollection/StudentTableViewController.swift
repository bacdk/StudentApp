//
//  StudentTableViewController.swift
//  ManagementCollection
//
//  Created by Cntt20 on 5/10/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController, UISearchResultsUpdating {

    //
    var studentList: [Student] = {
        return StudentList.getStudentList()
    }()
    var filteredStudents = [Student]()
    let searchController = UISearchController(searchResultsController: nil)
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudents.count
        }
        return studentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student Cell", for: indexPath) as! StudentTableViewCell
        let student: Student
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudents[indexPath.row]
        } else {
            student = studentList[indexPath.row]
        }
        // Configure the cell...
        cell.configureStudentViewCell(student: student)
        return cell
    }
    //
    func filterContentForSearchText(searchText: String) {
        filteredStudents = studentList.filter { student in
            return  student.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }

    //
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    //
    func foundInStudentList(student: Student) -> Int{
        for i in 0...studentList.count {
            if student.name == studentList[i].name && student.university == studentList[i].university {
                return i
            }
        }
        return -1
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Detail and Edit" {
            let indexPath = tableView.indexPathForSelectedRow
            var student: Student
            
            if searchController.isActive && searchController.searchBar.text != "" {
                student = filteredStudents[(indexPath?.row)!]
            } else {
                student = studentList[(indexPath?.row)!]
            }
            
            let editVC = segue.destination as! DetailAndEditViewController
            editVC.student = student
            editVC.navigationItem.leftItemsSupplementBackButton = true
        }
        
        if segue.identifier == "Add Student" {
            let addVC = segue.destination as! AddStudentViewController
            addVC.studentList = studentList
            tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if TempStudent.check {
            let student: Student = TempStudent.student
            studentList.append(student)
            tableView.reloadData()
            TempStudent.check = false
        }
        super.viewWillAppear(true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let student = studentList[fromIndexPath.row]
        student.remove(at: fromIndexPath.row)
        student.insert(student, at: to.row)

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        if searchController.isActive && searchController.searchBar.text != "" {
            return false
        } else {
            return true
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
