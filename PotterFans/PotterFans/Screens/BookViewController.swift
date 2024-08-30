//
//  BookViewController.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/28/24.
//

import UIKit

class BookViewController: UIViewController {
  var book: Book!

  private var posterView = PosterImageView(frame: .zero)
  private var titleLabel = UILabel()
  private var descriptionLabel = UILabel()
  private var releaseDateLabel = UILabel()
  private var pagesLabel = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    configure()
  }

  func configure() {
    view.backgroundColor = .systemBackground

    let posterURL = book.cover
    posterView.downloadImage(from: posterURL)

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    titleLabel.text = book.title
    titleLabel.numberOfLines = 0
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    titleLabel.font = .systemFont(ofSize: 20, weight: .bold)

    descriptionLabel.text = book.description
    descriptionLabel.textColor = .black
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textAlignment = .justified
    descriptionLabel.font = .systemFont(ofSize: 16)

    releaseDateLabel.text = "Released on: \(book.releaseDate)"
    releaseDateLabel.font = .systemFont(ofSize: 16)
    releaseDateLabel.numberOfLines = 1
    releaseDateLabel.textAlignment = .left
    releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false

    let pages = Int(book.pages)
    pagesLabel.text = "Number of pages: \(pages)"
    pagesLabel.font = .systemFont(ofSize: 16)
    pagesLabel.numberOfLines = 1
    pagesLabel.textAlignment = .left
    pagesLabel.translatesAutoresizingMaskIntoConstraints = false

    let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, releaseDateLabel, pagesLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    stackView.spacing = 4

    view.addSubview(posterView)
    view.addSubview(stackView)
    NSLayoutConstraint.activate([
      posterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      posterView.heightAnchor.constraint(equalToConstant: 300),
      posterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      stackView.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 50),

      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
    ])

  }
}
