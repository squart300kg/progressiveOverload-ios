//
//  MicroCycleSelectionController.swift
//  overload
//
//  Created by SangYun Song on 2022/02/14.
//

import UIKit

class MicroCycleSelectionController: UIViewController {
    
    var navigator: Navigator!
    
    init(navigator: Navigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        print("MicroCycleSelectionController hello world")
    }
}
