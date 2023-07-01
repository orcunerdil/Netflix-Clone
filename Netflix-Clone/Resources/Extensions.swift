//
//  Extensions.swift
//  Netflix-Clone
//
//  Created by Orçun Erdil on 1.07.2023.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        
        //bu işlemler sonucunda elde edilen ilk büyük harfli karakter, geri kalan küçük harflerle birleştirilerek yeni bir dize oluşturulur ve bu dize döndürülür.
        // "merhaba" -> "Merhaba" 
        return self .prefix(1).uppercased() + self.lowercased().dropFirst()
 
    }
    
}
