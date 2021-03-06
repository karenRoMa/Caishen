//
//  MonthInputTextField.swift
//  Caishen
//
//  Created by Daniel Vancura on 3/8/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public class MonthInputTextField: DetailInputTextField {
    
    /**
     Checks the validity of the entered month.
     
     - returns: True, if the month is valid.
     */
    internal override func isInputValid(month: String, partiallyValid: Bool) -> Bool {
        let length = month.characters.count
        if partiallyValid && length == 0 {
            return true
        }
        
        guard let monthInt = UInt(month) else {
            return false
        }
        
        if length == 1 && !["0","1"].contains(month) {
            return false
        }
        
        return ((monthInt >= 1 && monthInt <= 12) ||
            (partiallyValid && month == "0")) &&
            (partiallyValid || length == 2)
    }

    /**
     Returns the auto-completed text for the current month input
     E.g. if user input a "4", it should return a string of "04" instead.
     This makes the input process easier for users

     - returns: Auto-completed string.
     */
    internal override func autocompleteText(month: String) -> String {
        let length = month.characters.count
        if length != 1 {
            return month
        }

        let monthNumber = Int(month)
        if monthNumber > 1 {
            return "0" + month
        }

        return month
    }
}
