//
//  Array2D.swift
//  testProject
//
//  Created by Mac on 9/28/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class Array2D<T> {
    private var cols:Int
    private var rows:Int
    var matrix:[T]
    
    init(cols: Int, rows: Int, defaultValue:T) {
        self.cols = cols
        self.rows = rows
        self.matrix = Array(repeating:defaultValue, count:cols*rows)
    }
    
    subscript(col:Int, row:Int) -> T {
        get{
            return matrix[cols * row + col]
        }
        set {
            matrix[cols * row + col] = newValue
        }
    }
    
    func columnCount()-> Int{
        return cols
    }
    
    func rowCount() -> Int {
        return rows
    }
    
    
}

extension Array2D:CustomStringConvertible{
    var description:String {
        return String(matrix.enumerated().flatMap{ ($0.offset+1) % 10 == 0 ? "\($0.element) \n" : "\($0.element) "})
    }
}
