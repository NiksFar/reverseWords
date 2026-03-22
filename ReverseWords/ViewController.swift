//
//  ViewController.swift
//  ReverseWords
//
//  Created by Nikita on 18.01.2026.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar()
        let navItem = UINavigationItem(title: "Reverse Words")
        navBar.tintColor = .lightGray
        navBar.items = [navItem]
        navBar.accessibilityIdentifier = "navigationBar"
        
        return navBar
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reverse words"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.accessibilityIdentifier = "titleLabel"
        label.isAccessibilityElement = true
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "This application will reverse your words.  Please type text below"
        label.accessibilityIdentifier = "descriptionLabel"
        label.isAccessibilityElement = true
        
        return label
    }()
    
    private lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Text to reverse"
        textField.accessibilityIdentifier = "userTextField"
        
        return textField
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.accessibilityIdentifier = "separatorView"
        view.isAccessibilityElement = true

        return view
    }()
    
    private lazy var reverseResultLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.accessibilityIdentifier = "reverseResultLabel"
        label.isAccessibilityElement = true
        
        return label
    }()
    
    private lazy var reverseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.setTitle("Reverse", for: .normal)
        button.addTarget(self, action: #selector(reverseAction), for: .touchUpInside)
        button.accessibilityIdentifier = "reverseButton"
        
        return button
    }()
    
    private var isReversed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        userTextField.becomeFirstResponder()
        setupConstraints()
        view.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func reverseAction(){
        
        guard let userText = userTextField.text else { return }
        
        if isReversed {
            userTextField.text = ""
            reverseResultLabel.text = ""
            reverseButton.setTitle("Reverse Text", for: .normal)
            isReversed = false
        } else {
            reverseResultLabel.text = userText.withReversedWords
            reverseButton.setTitle("Clear", for: .normal)
            isReversed = true
        }
    }
    
    //
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //
    
    
    private func setupConstraints() {
        //
        view.addSubview(navigationBar)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(userTextField)
        view.addSubview(separatorView)
        view.addSubview(reverseResultLabel)
        view.addSubview(reverseButton)
        
        //
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        reverseResultLabel.translatesAutoresizingMaskIntoConstraints = false
        reverseButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // NavigationBar
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: Sizes.navigationBarHeight),

            // TitleLabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Spacing.titleTop),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.horizontal),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.horizontal),

            // DescriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.verticalMedium),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.horizontal),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.horizontal),

            // UserTextField
            userTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Spacing.verticalLarge),
            userTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.horizontal),
            userTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.horizontal),
            userTextField.heightAnchor.constraint(equalToConstant: Sizes.textFieldHeight),

            // SeparatorView
            separatorView.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: Spacing.verticalSmall),
            separatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.horizontal),
            separatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.horizontal),
            separatorView.heightAnchor.constraint(equalToConstant: Sizes.separatorHeight),

            // ReverseResultLabel
            reverseResultLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: Spacing.verticalSmall),
            reverseResultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.horizontal),
            reverseResultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.horizontal),
            reverseResultLabel.heightAnchor.constraint(equalToConstant: Sizes.reverseResultLabel),
            
            // ReverseButton
            reverseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.horizontal),
            reverseButton.heightAnchor.constraint(equalToConstant: Sizes.buttonHeight),
            reverseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Spacing.horizontal),
            reverseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Spacing.horizontal)
        ])
    }

}

private enum Spacing {
    static let horizontal: CGFloat = 20
    static let verticalSmall: CGFloat = 8
    static let verticalMedium: CGFloat = 15
    static let verticalLarge: CGFloat = 50
    static let titleTop: CGFloat = 150
}

private enum Sizes {
    static let navigationBarHeight: CGFloat = 45
    static let textFieldHeight: CGFloat = 40
    static let reverseResultLabel: CGFloat = 40
    static let separatorHeight: CGFloat = 3
    static let buttonHeight: CGFloat = 60
}
