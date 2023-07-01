//
//  HeroHeaderUIView.swift
//  Netflix-Clone
//
//  Created by Orçun Erdil on 1.07.2023.
//

import UIKit

class HeroHeaderUIView: UIView {
 
    private let downloadButton : UIButton = {
       
        let btn = UIButton()
        btn.setTitle("Download", for: .normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    private let playButton : UIButton = {
       
        let btn = UIButton()
        btn.setTitle("Play", for: .normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5

        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    private let heroImageView : UIImageView = {
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "heroImage")
        return imgView
        
    }()
    
    private func addGradient(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        btnConstraint()
    }
    
    private func btnConstraint() {
        let playBtnConstraint = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadConstraint = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        
        ]
        NSLayoutConstraint.activate(downloadConstraint)
        NSLayoutConstraint.activate(playBtnConstraint)
    }
    
    
    //Böylece heroImageView'un çerçevesi, üst sınıfın layoutSubviews() metodunun çağrıldığı görünümün sınırlarına (bounds) ayarlanır.
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
