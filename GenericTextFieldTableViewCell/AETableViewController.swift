//
//  TableViewController.swift
//  AEUserInterface
//
//  Created by Allan Evans on 9/29/16.
//  Copyright © 2016 Aelyssum Corp. All rights reserved.
//

import UIKit

class AETableViewController: UITableViewController {

    var stringValue: String = "John Doe"
    var email: String = "john.doe@icloud.com"
    var phoneNumber: String = "408 555-1111"
    var intValue: Int = 42
    var doubleValue: Double = 99.99
    
    enum TableRows: Int {
        case string, numeric, email, int, double
        static var count: Int {
            return double.rawValue+1
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AETestTableViewController"
        AETextFieldTableViewCell<String>.register(with: tableView)
        AETextFieldTableViewCell<Int>.register(with: tableView)
        AETextFieldTableViewCell<Double>.register(with: tableView)
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
        return TableRows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableRows(rawValue: indexPath.row)! {
        case .string:
            let cell = AETextFieldTableViewCell<String>.dequeue(onto: tableView, for: indexPath)
            cell.config(stringValue, withLabel: "String Value") {
                _stringValue in
                self.stringValue = _stringValue
            }
            return cell
        case .numeric:
            let cell = AETextFieldTableViewCell<String>.dequeue(onto: tableView, for: indexPath)
            cell.config(phoneNumber, withLabel: "Numeric Value", formattedAs: .numeric) {
                _phoneNumber in
                self.phoneNumber = _phoneNumber
            }
            return cell
        case .email:
            let cell = AETextFieldTableViewCell<String>.dequeue(onto: tableView, for: indexPath)
            cell.config(email, withLabel: "Email Value", formattedAs: .email) {
                _email in
                self.email = _email
            }
            return cell
        case .int:
            let cell = AETextFieldTableViewCell<Int>.dequeue(onto: tableView, for: indexPath)
            cell.config(intValue, withLabel: "Int Value") {
                _intValue in
                self.intValue = _intValue
            }
            return cell
        case .double:
            let cell = AETextFieldTableViewCell<Double>.dequeue(onto: tableView, for: indexPath)
            cell.config(doubleValue, withLabel: "Double Value") {
                _doubleValue in
                self.doubleValue = _doubleValue
            }
            return cell
        }
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

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
