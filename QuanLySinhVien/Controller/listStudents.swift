//
//  listStudent.swift
//  QuanLySinhVien
//
//  Created by Admin on 1/15/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class listStudents: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var studentsTableView: UITableView!
    var a = test()
    var b: Int?
    var arrStudents: [Students] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        b = a.a
        if let image = UIImage(named: "bg") {
            view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? StudentCell
        if let cell = cell {
            cell.textLabel?.text = arrStudents[indexPath.row].name
            return cell
        }
        return StudentCell()
    }
    
    
}

