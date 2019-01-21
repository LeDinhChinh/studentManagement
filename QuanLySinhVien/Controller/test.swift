//
//  test.swift
//  QuanLySinhVien
//
//  Created by Admin on 1/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class test {
    fileprivate var a = 5
}

class test1 {
    private var b = 5
    var c = test().a
}

extension test1 {
    
}
