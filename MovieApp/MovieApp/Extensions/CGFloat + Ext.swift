//
//  CGFloat + Ext.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 26.02.2024.
//

import UIKit


extension UIViewController {
    var screenWidth: CGFloat {
        return view.frame.size.width
    }
    
    var screenHeigth: CGFloat {
        return view.frame.size.height
    }
}

extension UIView {
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenHeigth: CGFloat {
        return UIScreen.main.bounds.height
    }
}
