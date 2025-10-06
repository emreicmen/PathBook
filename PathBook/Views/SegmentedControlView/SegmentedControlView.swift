//
//  File.swift
//  AVFoundationLearn
//
//  Created by Andaç on 31.12.2021.
//

import UIKit
import SnapKit

final class SegmentedControlView: UIView {
  @IBOutlet var containerView: UIView!
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  var onSegmentChanged: ((Int) -> Void)?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadNib()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    loadNib()
  }
    
  private func loadNib() {
    Bundle.main.loadNibNamed("SegmentedControlView", owner: self, options: nil)
    
    addSubview(containerView)
    
    containerView.frame = self.bounds
    containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    containerView.layer.masksToBounds = true
    
    // Renk ve stil ayarları
    segmentedControl.selectedSegmentTintColor = .systemBlue
    segmentedControl.backgroundColor = .systemGray6
    segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
    
    segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
  }
  
//  func configure() {
//    snp.makeConstraints { make in
//      make.top.equalToSuperview()
//      make.right.equalToSuperview()
//      make.left.equalToSuperview()
//      make.bottom.equalToSuperview()
//    }
//  }
//  
  func configure(with titles: [String] = ["Gidilecek", "Favori", "Gidildi"]) {
    segmentedControl.removeAllSegments()
    for (index, title) in titles.enumerated() {
      segmentedControl.insertSegment(withTitle: title, at: index, animated: false)
    }
    segmentedControl.selectedSegmentIndex = 0
    
    // Konumlandırma (SnapKit)
    snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  @objc private func segmentChanged(_ sender: UISegmentedControl) {
    onSegmentChanged?(sender.selectedSegmentIndex)
  }
}
