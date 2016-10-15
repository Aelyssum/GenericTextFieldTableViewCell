//
//  AEStringConvertible.swift
//  GenericTextFieldTableViewCell
//
//  Created by Allan Evans on 10/15/16.
//  Copyright © 2016 Aelyssum Corp. All rights reserved.
//

import Foundation

public protocol AEStringConvertible: CustomStringConvertible {
    init?(fromString stringValue: String)
}

extension String: AEStringConvertible {
    public init?(fromString stringValue: String) {
        self = stringValue
    }
}

extension Int: AEStringConvertible {
    public init?(fromString stringValue: String) {
        if let value = Int(stringValue) {
            self = value
        } else {
            return nil
        }
    }
}

extension Double: AEStringConvertible {
    public init?(fromString stringValue: String) {
        if let value = Double(stringValue) {
            self = value
        } else {
            return nil
        }
    }
}

