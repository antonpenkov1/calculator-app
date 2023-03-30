//
//  CustomButton.swift
//  Calculator
//
//  Created by Антон Пеньков on 30.03.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        styleButton()
    }
    
    func styleButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor.gray
        layer.cornerRadius = 25
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
}
