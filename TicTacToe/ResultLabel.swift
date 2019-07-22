//
//  ResultLabel.swift
//  TicTacToe
//
//  Created by Sahil Gogna on 2019-07-10.
//  Copyright © 2019 Sahil Gogna. All rights reserved.
//

import UIKit

class ResultLabel: UILabel {
    
    // for render in storyboard view (xcode)
    override func prepareForInterfaceBuilder() {
        customRender()
    }
    
    // for render in runtime
    override func awakeFromNib() {
        super.awakeFromNib()
        customRender()
    }
    
    func customRender() {
        backgroundColor = #colorLiteral(red: 1, green: 0.4002310634, blue: 0.4645982981, alpha: 1)
        layer.cornerRadius = 15
        clipsToBounds = true
        textAlignment = .center
    }

}
