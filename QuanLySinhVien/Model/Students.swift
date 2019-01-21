//
//  SinhVien.swift
//  QuanLySinhVien
//
//  Created by Admin on 1/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
protocol scoreSubject {
    func mediumscore() -> Double
}

struct Students: scoreSubject {
    var name: String = ""
    var ID: Int = 0
    var phoneNumber: String = ""
    var email: String = ""
    var scoreC: Double = 0
    var scoreCDotDot: Double = 0
    var scoreJava: Double = 0
    var scoreSwift: Double = 0
    var scoreIOS: Double = 0
    
    func mediumscore() -> Double {
        let mediumscore: Double = (scoreC + scoreCDotDot + scoreJava + scoreSwift + scoreIOS) / 5
        return mediumscore
    }
    
    init(_ name: String,_ ID: String,_ phoneNumber: String,_ email: String,_ scoreC: String,_ scoreCDotDot: String,_ scoreJava: String,_ scoreSwift: String,_ scoreIOS: String) {
        self.name = name
        self.ID = Int(ID) ?? 0
        self.phoneNumber = phoneNumber
        self.email = email
        self.scoreC = Double(scoreC) ?? 0
        self.scoreCDotDot = Double(scoreCDotDot) ?? 0
        self.scoreJava = Double(scoreJava) ?? 0
        self.scoreSwift = Double(scoreSwift) ?? 0
        self.scoreIOS = Double(scoreIOS) ?? 0
    }
}
