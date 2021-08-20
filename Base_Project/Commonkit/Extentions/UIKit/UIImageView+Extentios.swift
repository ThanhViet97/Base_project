//
//  UIImageView+Extentios.swift
//  Base_Project
//
//  Created by VietPT on 17/08/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(image: UIImage? = nil,
                  url: URL? = nil,
                  placeholder: UIImage? = nil,
                  isLoading: Bool = true,
                  isResize: Bool = true,
                  forceRefresh: Bool = false) {
        guard image == nil else {
            self.image = image
            return
        }
        if isLoading {
            self.kf.indicatorType = .activity
        }
        var options = [KingfisherOptionsInfoItem]()
        if isResize {
            let processor = DownsamplingImageProcessor(size: self.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            options = [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ]
        }
        if forceRefresh {
            options.append(.forceRefresh)
        }
        
        kf.setImage(with: url,
                    placeholder: placeholder,
                    options: options) { (result) in
            //Handle result
        }
    }
    
    func setImage(url: URL?, placeholderName: String) {
        let placeholder = UIImage(named: placeholderName)
        self.setImage(url: url, placeholder: placeholder)
    }
}
