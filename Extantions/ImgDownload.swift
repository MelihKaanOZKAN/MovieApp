//
//  ImgDownload.swift
//  MovieApp
//
//  Created by Melih Özkan on 26.09.2020.
//

import UIKit
extension UIImageView {
    func downloaded(url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(url: url, contentMode: mode)
    }
    
}

extension UIButton{
    func setBorder(){
        self.layer.cornerRadius = 2.0
        self.layer.borderWidth = 4.0
        self.layer.borderColor = UIColor(red: 0, green:72/255, blue:99/552, alpha: 0).cgColor
        self.layer.masksToBounds = true;
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0);
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}

