//
//  ExerciseTypeTable.swift
//  overload
//
//  Created by SangYun Song on 2022/02/18.
//

import Foundation
import RealmSwift

class ExerciseTypeTable: Object {
    
    @objc dynamic var no: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var weight: Float = 0.0
    @objc dynamic var repitition: Int = 0
    @objc dynamic var setNum: Int = 0
    @objc dynamic var restTime: Int = 0
    @objc dynamic var rir: Int = 0
    @objc dynamic var programNo: Int = 0
    @objc dynamic var mesoCycleSplitIndex: Int = 0
    @objc dynamic var microCycleSplitIndex: Int = 0
    
    convenience init(no: Int, name: String, weight: Float, rep: Int, setNum: Int, rest: Int, rir: Int, programNo: Int, mesoCycleSplitIndex: Int, microCycleSplitIndex: Int) {
        self.init()
        self.no = no
        self.name = name
        self.weight = weight
        self.repitition = rep
        self.setNum = setNum
        self.restTime = rest
        self.rir = rir
        self.programNo = programNo
        self.mesoCycleSplitIndex = mesoCycleSplitIndex
        self.microCycleSplitIndex = microCycleSplitIndex
    }
    
    override class func primaryKey() -> String? {
        return "no"
    }
}
