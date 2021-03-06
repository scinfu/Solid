//
//  SDSkipQuery.swift
//  Solid
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

public class SDSkipQuery: SDArrayQuery {
    
    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    public init(count: Int) {
        super.init()
        
        
        // Assertion for count
        
        assert(count >= 0, "Count should not be less than 0")
        
        
        // Initialize count
        
        _count = count
    }
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Variables & properties
    
    private var _count: Int!
    
    public var count: Int {
        get {
            return _count
        }
    }
    
    
    // MARK: Public methods
    
    public override func queryDescription() -> String {
        return String(format: "Skip %d elements", arguments: [count])
    }
    
    public override func perform(withArray array: [AnyObject]) -> [AnyObject] {
        // Check whether required skip count is bigger than 0
        
        guard count > 0 else {
            return array
        }
        
        
        // Check whether number of elements in array is bigger than 0
        
        guard array.count > 0 else {
            return []
        }
        
        
        // Obtain start index of selection and max index in array
        
        let startIndexOfSelection = count
        let maxIndexInArray = array.count - 1
        
        
        // Check whether start index of selection is inside of array's bounds
        
        guard startIndexOfSelection <= maxIndexInArray else {
            return []
        }
        
        
        // Obtain range for selection
        
        let numberOfElementsInSelection = array.count - startIndexOfSelection
        let range = NSMakeRange(startIndexOfSelection, numberOfElementsInSelection)
        
        
        // Obtain result array
        
        let resultArray = (array as NSArray).subarray(with: range) as [AnyObject]
        
        
        // Return result
        
        return resultArray
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Protocol methods
    
}
