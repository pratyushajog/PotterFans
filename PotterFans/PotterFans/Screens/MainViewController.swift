//
//  MainViewController.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/27/24.
//

import UIKit

class MainViewController: UIViewController {

  private var booksButton: UIButton!
  private var charactersButton: UIButton!
  private var housesButton: UIButton!
  private var spellsButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    configureViewController()
    configureBooksButton()
    configureCharactersButton()
    configureHousesButton()
    configureSpellsButton()
    setupConstraints()
  }

  func configureViewController() {
    title = "Potter World"
    navigationController?.navigationBar.prefersLargeTitles = true
    view.backgroundColor = .white
  }

  func configureBooksButton() {
    var configuration = UIButton.Configuration.filled()
    configuration.buttonSize = .large
    configuration.cornerStyle = .large
    configuration.title = "Books"
    configuration.image = UIImage(systemName: SFSymbols.books)
    booksButton = UIButton(configuration: configuration, primaryAction: UIAction { _ in
      DispatchQueue.main.async { [weak self] in
        guard let self = self else { return }

        let booksVC = BooksViewController()
        self.navigationController?.pushViewController(booksVC, animated: true)
      }
    })
    booksButton.translatesAutoresizingMaskIntoConstraints = false
  }

  func configureCharactersButton() {
    var configuration = UIButton.Configuration.filled()
    configuration.buttonSize = .large
    configuration.cornerStyle = .large
    configuration.title = "Characters"
    configuration.image = UIImage(systemName: SFSymbols.characters)

    charactersButton = UIButton(configuration: configuration, primaryAction: UIAction { _ in
      print("Characters button pressed")
    })
    charactersButton.translatesAutoresizingMaskIntoConstraints = false
  }

  func configureHousesButton() {
    var configuration = UIButton.Configuration.filled()
    configuration.buttonSize = .large
    configuration.cornerStyle = .large
    configuration.title = "Houses"
    configuration.image = UIImage(systemName: SFSymbols.houses)

    housesButton = UIButton(configuration: configuration, primaryAction: UIAction { _ in
      print("Houses button pressed")
    })
    housesButton.translatesAutoresizingMaskIntoConstraints = false
  }

  func configureSpellsButton() {
    var configuration = UIButton.Configuration.filled()
    configuration.buttonSize = .large
    configuration.cornerStyle = .large
    configuration.title = "Spells"
    configuration.image = UIImage(systemName: SFSymbols.spells)

    spellsButton = UIButton(configuration: configuration, primaryAction: UIAction { _ in
      print("Spells button pressed")
    })
    spellsButton.translatesAutoresizingMaskIntoConstraints = false
  }

  func setupConstraints() {
    let stackView = UIStackView(arrangedSubviews: [booksButton, charactersButton, housesButton, spellsButton])
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
    ])
  }
}
