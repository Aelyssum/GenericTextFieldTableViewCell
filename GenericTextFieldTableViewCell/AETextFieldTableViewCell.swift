//
//  AETextFieldTableViewCell.swift
//  Crème de la CRM
//
//  Created by Allan Evans on 9/21/16.
//  Copyright © 2016 Aelyssum Corp. All rights reserved.
//

import UIKit
import Foundation

public enum AETextFieldCellTextFormat {
    case text, email, numeric, none
}

public class AETextFieldTableViewCell<S: AEStringConvertible>: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    public class func register(with tableView: UITableView) {
        tableView.register(UINib(nibName: "AETextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "\(self)")
    }
    
    public class func dequeue(onto tableView: UITableView, for indexPath: IndexPath) -> AETextFieldTableViewCell<S> {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(self)", for: indexPath) as! AETextFieldTableViewCell<S>
        return cell 
    }

    var value: S!
    var textFieldFormat: AETextFieldCellTextFormat!
    var updateHandler: ((_ : S) -> ())!
    
    public func config(_ value: S,
                       withLabel label: String,
                       formattedAs format: AETextFieldCellTextFormat = .none,
                       handler: @escaping (_ : S) -> ()
        ) {
        self.label.text = label
        self.value = value
        self.textFieldFormat = format
        self.updateHandler = handler
        self.textField.delegate = self
        updateTextFields()
    }
    
    func updateTextFields() {
        if let val = value  {
            self.textField.text! = String(describing: val)
        } else {
            self.textField.text! = ""
        }
        switch textFieldFormat! {
        case .text:
            self.textField.keyboardType = UIKeyboardType.default
            self.textField.autocorrectionType = .yes
        case .email:
            self.textField.keyboardType = UIKeyboardType.emailAddress
            self.textField.autocorrectionType = .no
        case .numeric:
            self.textField.keyboardType = UIKeyboardType.numberPad
            self.textField.autocorrectionType = .no
        case .none where value is Int:
            self.textField.keyboardType = UIKeyboardType.numberPad
        case .none:
            self.textField.keyboardType = UIKeyboardType.decimalPad
        }
        
    }
    
    // MARK:  UITextField delegate methods
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.invalidateIntrinsicContentSize()
        self.contentView.setNeedsUpdateConstraints()
        self.contentView.updateConstraintsIfNeeded()
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        if let val = S(fromString: textField.text!) {
            value = val
        }
        self.endEditing(true)
        updateHandler(value)
    }
    
}
