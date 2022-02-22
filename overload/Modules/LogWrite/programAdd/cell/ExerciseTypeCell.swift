//
//  ExerciseTypeCell.swift
//  overload
//
//  Created by SangYun Song on 2022/02/21.
//

import Foundation
import UIKit

class ExerciseTypeCell: UITableViewCell {
    
    static let identifier = "exerciseTypeCell"
    
    var name = String()
    
    lazy var exerciseInfoVIew: UIView = {
        let view = UIView()
        view.cornerRadius = 10
        view.backgroundColor = MainColor().light_gray
        view.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        return view
    }()
    
    lazy var weightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var nameTextView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
         
        return label
    }()
    
    lazy var weightTextView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = MainColor().main_orange
        label.textAlignment = .center
        return label
    }()
    
    lazy var weightView: UILabel = {
        let label = UILabel()
        label.text = "중량"
        label.textAlignment = .center
        return label
    }()
    
    lazy var repStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var repTextView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = MainColor().main_orange
        label.textAlignment = .center
        return label
    }()
    
    lazy var repView: UILabel = {
        let label = UILabel()
        label.text = "반복수"
        label.textAlignment = .center
        return label
    }()
    
    lazy var setNumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var setNumTextView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = MainColor().main_orange
        label.textAlignment = .center
        return label
    }()
    
    lazy var setNumView: UILabel = {
        let label = UILabel()
        label.text = "세트수"
        label.textAlignment = .center
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
  
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        contentView.addSubview(exerciseInfoVIew)
        contentView.addSubview(nameTextView)
        exerciseInfoVIew.addSubview(weightStackView)
        exerciseInfoVIew.addSubview(repStackView)
        exerciseInfoVIew.addSubview(setNumStackView)
        
        weightStackView.addArrangedSubview(weightTextView)
        weightStackView.addArrangedSubview(weightView)
        
        repStackView.addArrangedSubview(repTextView)
        repStackView.addArrangedSubview(repView)
        
        setNumStackView.addArrangedSubview(setNumTextView)
        setNumStackView.addArrangedSubview(setNumView)
        
        exerciseInfoVIew.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(10)
        }
        
        nameTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        weightStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        repStackView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        setNumStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
