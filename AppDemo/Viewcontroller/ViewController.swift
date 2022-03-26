//
//  ViewController.swift
//  AppDemo
//
//  Created by Dat Nguyen on 06/01/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, OutputProtocol {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var listModel: [MoviesListModel] = []
    let moviesPresenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        moviesPresenter.attachView(self)
        callApi()
    }
    
    @IBAction func pushto(_ sender: Any) {
        let vcB = ViewControllerB()
        self.navigationController?.pushViewController(vcB, animated: true)
    }
    
    func callApi(){
        self.moviesPresenter.getMovies(page: 1, apiKey: APIKey.apiKey)
//        self.moviesPresenter.getMovies(page: 1, apiKey: APIKey.apiKey)
//        self.moviesPresenter.getList(page: 1, apiKey: APIKey.apiKey, classType: ResponseModel<[MoviesListModel]>.self)
    }
    
    func setupView(){
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateView(listMovies: [MoviesListModel]) {
        listModel = listMovies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setupView(model: listModel[indexPath.row])
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2 - 21
        return CGSize(width: width, height: width + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }

}

