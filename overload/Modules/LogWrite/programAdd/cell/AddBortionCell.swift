//
//  AddBortionCell.swift
//  overload
//
//  Created by SangYun Song on 2022/02/21.
//

import Foundation
import UIKit

class AddBortionCell: UITableViewCell {
    
    static let identifier = "addBortionCellCell"
  
    lazy var plusImage: UIImageView = {
        let imageView = UIImageView(image: R.image.icon_plus())
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        return imageView
    }()
    
    lazy var addText: UILabel = {
        let label = UILabel()
        label.text = "프로그램 등록"
        label.textAlignment = .center
        label.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func makeUI() {
        
        contentView.addSubview(plusImage)
        contentView.addSubview(addText)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.contentView.addDashedBorder()
        }
  
        plusImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.centerX.equalToSuperview()
        }

        addText.snp.makeConstraints { make in
            make.top.equalTo(plusImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
