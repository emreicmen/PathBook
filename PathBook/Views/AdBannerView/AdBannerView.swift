//
//  File.swift
//  AVFoundationLearn
//
//  Created by Andaç on 31.12.2021.
//

import UIKit
import SnapKit

final class AdBannerView: UIView {
  @IBOutlet var contentView: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadNib()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    loadNib()
  }
    
  private func loadNib() {
    Bundle.main.loadNibNamed("AdBannerView", owner: self, options: nil)
    
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.masksToBounds = true
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
