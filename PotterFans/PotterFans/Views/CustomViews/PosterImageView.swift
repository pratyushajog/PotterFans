//
//  PosterImageView.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/28/24.
//

import UIKit

class PosterImageView: UIImageView {

  let placeHolderImage = UIImage(named: SFSymbols.books)

  override init(frame: CGRect) {
    super.init(frame: frame)

    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    layer.cornerRadius = 10
    clipsToBounds = true
    image = placeHolderImage
    translatesAutoresizingMaskIntoConstraints = false
  }

  func downloadImage(from string: String) {
    guard let url = URL(string: string) else {
      return
    }

    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let self = self else { return }
      guard error == nil else {
        return
      }

      guard let data = data else {
        return
      }

      let image = UIImage(data: data)
      DispatchQueue.main.async {
        self.image = image
      }
    }

    task.resume()
  }
}
