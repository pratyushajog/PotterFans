//
//  BookCollectionViewCell.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/28/24.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
  static let reuseId = "BookCell"

  let posterView = PosterImageView(frame: .zero)

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureCell()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureCell() {
    addSubview(posterView)
    posterView.frame = self.bounds
  }

  func setupPoster(_ with: String) {
    posterView.downloadImage(from: with)
  }
}
