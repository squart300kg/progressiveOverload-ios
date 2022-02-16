//
//  TableViewController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/15.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: ViewController, UIScrollViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TableViewController {
    
}

extension TableViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//
//        print("willDisplayHeaderView")
//    }
    
    // 테이블 뷰 리로드 시 뷰 깨짐 현상 수정
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
