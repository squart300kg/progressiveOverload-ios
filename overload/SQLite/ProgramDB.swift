//
//  ProgramDB.swift
//  overload
//
//  Created by SangYun Song on 2022/02/19.
//

import Foundation
import SQLite3

class ProgramDB {
    
    init() {
        if sqlite3_open(path, &db) == SQLITE_OK {
            print("테이블 생성 완료!!")
            if sqlite3_exec(db, crerateProgramTable, nil, nil, nil) == SQLITE_OK,
               sqlite3_exec(db, crerateExerciseTypeTable, nil, nil, nil) == SQLITE_OK,
               sqlite3_exec(db, crerateRecordTable, nil, nil, nil) == SQLITE_OK {
                return
            }
        }
        print("테이블 생성 에러!!")
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    func insertProgram(program: ProgramTable) -> Int {
        let sql = "INSERT INTO ProgramTable (name, mesoSplitText, mesoSplitCount, microCycleText, microCycleCount, isDummy, isDummyDataInit) VALUES (?,?,?,?,?,?,?)"
        var stmt: OpaquePointer?
        
        print("sql2 : name : \(program.name)\n mesoText : \(program.mesoSplitText)\n mesoCount :\(program.mesoSplitCount)\n microText : \(program.microCycleText)\n mircoCount :\(program.microCycleCount)\n")
        
        if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_text(stmt, 1, ((program.name) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(stmt, 2, ((program.mesoSplitText) as NSString).utf8String, -1, nil)
            sqlite3_bind_int(stmt, 3, program.mesoSplitCount)
            sqlite3_bind_text(stmt, 4, ((program.microCycleText) as NSString).utf8String, -1, nil)
            sqlite3_bind_int(stmt, 5, program.microCycleCount)
            sqlite3_bind_int(stmt, 6, program.isDummy ? 1 : 0)
            sqlite3_bind_int(stmt, 7, program.isDummyDataInit ? 1 : 0)
            if sqlite3_step(stmt) == SQLITE_DONE {
                print("sqlSuccess")
            } else {
                print("sqlFail")
            }
        } else {
            print("sql is not prepared")
        }
        sqlite3_finalize(stmt)
        return Int(sqlite3_last_insert_rowid(db))
    }
}
