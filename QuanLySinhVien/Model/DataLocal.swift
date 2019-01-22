//
//  DataLocal.swift
//  QuanLySinhVien
//
//  Created by Admin on 1/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import FMDB

let TABLE_STUDENT = "Students"
let NAME = "name"
let ID = "ID"
let PHONENUMBER = "phoneNumber"
let EMAIL = "email"
let SCOREC = "scoreC"
let SCORECDOTDOT = "scoreCDotDot"
let SCOREJAVA = "scoreJava"
let SCORESWIFT = "scoreSwift"
let SCOREIOS = "scoreIOS"

open class DataLocal {
    class func insertRecore(_ name: String,_ id: String,_ phoneNumber: String,_ email: String,_ scoreC: String,_ scoreCDotDot: String,_ scoreJava: String,_ scoreSwift: String,_ scoreIOS: String ) {
        var check: Bool = false
        let db: FMDatabase = FMDatabase.init(path: AppDelegate.sharedInstance.databasePath)
        if !db.open() {
            return
        }
        
        let query: String = String.init(format: "INSERT OR REPLACE INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@) VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@')",
                                        TABLE_STUDENT, NAME, ID, PHONENUMBER, EMAIL, SCOREC, SCORECDOTDOT, SCOREJAVA, SCORESWIFT, SCOREIOS,
                                        name, id, phoneNumber, email, scoreC, scoreCDotDot, scoreJava, scoreSwift, scoreIOS)
        check = db.executeStatements(query) // Thực thi một loạt câu lệnh SQL được kết hợp trong một chuỗi đơn.
        db.close()
        print(check)
    }
    
    class func getDataStudents() -> [Students] {
        var arrStudents: [Students] = [Students]()
        let db: FMDatabase = FMDatabase.init(path: AppDelegate.sharedInstance.databasePath)
        if !db.open() {
            return arrStudents
        }
        
        do {
            let query: String = String.init(format: "SELECT * FROM %@", TABLE_STUDENT)
            let result: FMResultSet = try db.executeQuery(query, values: nil) // Thực thi câu lệnh chọn, các truy vấn thực thi trả về một đối tượng FMResultSet nếu thành công.
            while result.next() {
                if let name = result.string(forColumn: NAME),
                    let id = result.string(forColumn: ID),
                    let phoneNumber = result.string(forColumn: PHONENUMBER),
                    let email = result.string(forColumn: EMAIL),
                    let scoreC = result.string(forColumn: SCOREC),
                    let scoreCDotDot = result.string(forColumn: SCORECDOTDOT),
                    let scoreJava = result.string(forColumn: SCOREJAVA),
                    let scoreSwift = result.string(forColumn: SCORESWIFT),
                    let scoreIOS = result.string(forColumn: SCOREIOS) {
                    let student = Students(name, id, phoneNumber, email, scoreC, scoreCDotDot, scoreJava, scoreSwift, scoreIOS)
                    arrStudents.append(student)
                }
            }
        } catch {
            print("error")
        }
        db.close()
        return arrStudents
    }
}
