//
//  File.swift
//  AVFoundationLearn
//
//  Created by Andaç on 31.12.2021.
//

import UIKit
import SnapKit

final class SearchBarView: UIView {
  @IBOutlet var containerView: UIView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadNib()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    loadNib()
  }
    
  private func loadNib() {
    Bundle.main.loadNibNamed("SearchBarView", owner: self, options: nil)
    
    addSubview(containerView)
    
    containerView.layer.cornerRadius = 8
    searchBar.layer.cornerRadius = 8
    containerView.frame = self.bounds
    containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    containerView.layer.masksToBounds = true
  }
  
  func configure() {
    snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
}
