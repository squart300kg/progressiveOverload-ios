//
//  R.generated.swift
//  overload
//
//  Created by SangYun Song on 2022/02/12.
//

import Foundation
import Rswift

struct R: Rswift.Validatable {
    
    fileprivate class Class {}
    
    fileprivate static let hostingBundle = Bundle(for: R.Class.self)
    
    static func validate() throws {
        
    }
    

    struct image {
        static let icon_tabbar_selected_write = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_tabbar_selected_home")
        static let icon_tabbar_selected_read = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_tabbar_selected_myinfo")
        static let icon_tabbar_unselected_write = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_tabbar_home")
        static let icon_tabbar_unselected_read = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_tabbar_myinfo")
        static let icon_plus = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon_plus")
    
        #if os(iOS) || os(tvOS)
        static func icon_tabbar_selected_write(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
            return UIKit.UIImage(resource: R.image.icon_tabbar_selected_write, compatibleWith: traitCollection)
        }
        #endif
        
        #if os(iOS) || os(tvOS)
        static func icon_tabbar_selected_read(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
            return UIKit.UIImage(resource: R.image.icon_tabbar_selected_read, compatibleWith: traitCollection)
        }
        #endif
        
        #if os(iOS) || os(tvOS)
        static func icon_tabbar_unselected_write(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
            return UIKit.UIImage(resource: R.image.icon_tabbar_unselected_write, compatibleWith: traitCollection)
        }
        #endif

        #if os(iOS) || os(tvOS)
        static func icon_tabbar_unselected_read(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
            return UIKit.UIImage(resource: R.image.icon_tabbar_unselected_read, compatibleWith: traitCollection)
        }
        #endif
        
        #if os(iOS) || os(tvOS)
        static func icon_plus(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
            return UIKit.UIImage(resource: R.image.icon_plus, compatibleWith: traitCollection)
        }
        #endif
        
    }
}
