//
//  SearchCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 20.09.2025.
//

import UIKit

protocol SearchCollectionViewCellDelegate: AnyObject {
  func didSearch(for text: String)
}

class SearchCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var searchBarView: SearchBarView!
  
  weak var delegate: SearchCollectionViewCellDelegate?
  
  func configure() {
    searchBarView.searchBar.delegate = self
  }
}

extension SearchCollectionViewCell: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
    guard let text = searchBar.text, !text.isEmpty else { return }
    delegate?.didSearch(for: text)
  }
}
