//
//  ProgramTable.swift
//  overload
//
//  Created by SangYun Song on 2022/02/18.
//

import Foundation
import RealmSwift

class ProgramTable: Object {
    
    @objc dynamic var no: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var mesoSplitText: String = ""
    @objc dynamic var mesoSplitCount: Int = 0
    @objc dynamic var microCycleText: String = ""
    @objc dynamic var microCycleCount: Int = 0
    @objc dynamic var isDummy: Bool = false
    @objc dynamic var isDummyDataInit: Bool = false
    
    convenience init(no: Int, name: String, mesoSplitText: String, mesoSplitCount: Int, microCycleText: String, microCycleCount: Int, isDummy: Bool, isDummyDataInit: Bool) {
        self.init()
        self.no = no
        self.name = name
        self.mesoSplitText = mesoSplitText
        self.mesoSplitCount = mesoSplitCount
        self.microCycleText = microCycleText
        self.microCycleCount = microCycleCount
        self.isDummy = isDummy
        self.isDummyDataInit = isDummyDataInit
    }
    
    override class func primaryKey() -> String? {
        return "no"
    }
}
