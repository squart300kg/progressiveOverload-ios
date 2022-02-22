//
//  CycleSelectionCell.swift
//  overload
//
//  Created by SangYun Song on 2022/02/16.
//

import Foundation
import UIKit

class CycleSelectionCell: UITableViewCell {
    
    static let identifier = "cycleSelectionCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
