//
//  CollectionViewCell.swift
//  AppDemo
//
//  Created by Dat Nguyen on 06/01/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(model: MoviesListModel) {
        //        self.backgroundColor = UIColor.black
        download(from: APIDomain.domainImg + (model.poster_path ?? ""))
    }
    
    
    
    func download(from urlString: String){
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        let img = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
                        
                        img.image = UIImage(data: data)
                        self.addSubview(img)
                    }
                }
            }
        }
        
    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
