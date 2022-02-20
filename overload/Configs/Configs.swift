//
//  Configs.swift
//  overload
//
//  Created by SangYun Song on 2022/02/12.
//

import UIKit
import RxSwift
import RxCocoa
import SQLite3

/// 플레이어에서 다른 화면 전환 시 sender
var tabBarVC: UITabBarController?
var currentView_0: UIViewController?
var currentView_1: UIViewController? 

//sqllite설정
let path: String = {
    let fm = FileManager.default
    return fm.urls(for: .libraryDirectory, in: .userDomainMask).last!
        .appendingPathComponent("programs.db").path
}()

let crerateProgramTable = """
    CREATE TABLE IF NOT EXISTS ProgramTable(
    no INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    mesoSplitText TEXT,
    mesoSplitCount INTEGER,
    microCycleText TEXT,
    microCycleCount INTEGER,
    isDummy INTEGER,
    isDummyDataInit INTEGER);
    """

let crerateExerciseTypeTable = """
    CREATE TABLE IF NOT EXISTS ExerciseTypeTable(
    no INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    weight REAL,
    repitition INTEGER,
    setNum INTEGER,
    restTime INTEGER,
    rpe INTEGER,
    programNo INTEGER,
    mesoCycleSplitIndex INTEGER,
    microCycleSplitIndex INTEGER);
    """
 
let crerateRecordTable = """
    CREATE TABLE IF NOT EXISTS RecordTable(
    no INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    weight REAL,
    repitition INTEGER,
    setNum INTEGER,
    restTime INTEGER,
    rpe INTEGER,
    recordTime TEXT,
    programNo INTEGER,
    exerciseTypeNo INTEGER);
    """

var db : OpaquePointer?

