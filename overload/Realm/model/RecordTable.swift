//
//  RecordTable.swift
//  overload
//
//  Created by SangYun Song on 2022/02/18.
//

import Foundation
import RealmSwift

class RecordTable: Object {
    
    @objc dynamic var no: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var weight: Float = 0.0
    @objc dynamic var repitition: Int = 0
    @objc dynamic var setNum: Int = 0
    @objc dynamic var restTime: Int = 0
    @objc dynamic var rpe: Int = 0
    @objc dynamic var recordTime: String = ""
    @objc dynamic var programNo: Int = 0
    @objc dynamic var exerciseTypeNo: Int = 0
    
    convenience init(no: Int, name: String, weight: Float, repitition: Int, setNum: Int, restTime: Int, rpe: Int, recordTime: String, programNo: Int, exerciseTypeNo: Int) {
        self.init()
        self.no = no
        self.name = name
        self.weight = weight
        self.repitition = repitition
        self.setNum = setNum
        self.restTime = restTime
        self.rpe = rpe
        self.recordTime = recordTime
        self.programNo = programNo
        self.exerciseTypeNo = exerciseTypeNo
    }
    
    override class func primaryKey() -> String? {
        return "no"
    }
}
