//
//  ViewController.swift
//  VkProfileCode
//
//  Created by Даниил Смирнов on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Elements
    private lazy var personalImage: UIImageView = {
        let image = UIImageView()
        
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        image.image = UIImage(named: "userImage")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.width / 2
        
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Даниил Смирнов"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private lazy var setupStatusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Установить статус"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 15, weight: .light)
        
        return label
    }()
    
    private lazy var setupStatus: UIButton = {
        let button = UIButton()
        
        button.setTitle("online", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .thin)
        
        let image = UIImage(systemName: "iphone")
        button.setImage(image, for: .normal)
        button.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Редактировать", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var historyButton = createButton(with: "История", backGroundColor: .black)
    private lazy var recordButton = createButton(with: "Запись", backGroundColor: .black)
    private lazy var photoButton = createButton(with: "Фото", backGroundColor: .black)
    private lazy var videoButton = createButton(with: "Клип", backGroundColor: .black)
    
    private lazy var historyImage = createButton(with: "camera", colorButton: .systemBlue)
    private lazy var recordImage = createButton(with: "square.and.pencil", colorButton: .systemBlue)
    private lazy var photoImage = createButton(with: "photo", colorButton: .systemBlue)
    private lazy var videoImage = createButton(with: "video.bubble.left", colorButton: .systemBlue)
    
    private lazy var firstButtonWithTitle = createButtonWithTitle(title: "Город: Москва", titleColor: .lightGray, weight: .regular)
    private lazy var secondButtonWithTitle = createButtonWithTitle(title: "35 подписчиков", titleColor: .lightGray, weight: .regular)
    private lazy var thirdButtonWithTitle = createButtonWithTitle(title: "Указать место работы", titleColor: .systemBlue, weight: .regular)
    private lazy var fourthButtonWithTitle = createButtonWithTitle(title: "Получить подарок", titleColor: .systemPurple, weight: .regular)
    private lazy var fifthButtonWithTitle = createButtonWithTitle(title: "Подробная информация", titleColor: .white, weight: .semibold)
    
    private lazy var  firstButtonWithImage = createButton(with: "house", colorButton: .lightGray)
    private lazy var  secondButtonWithImage = createButton(with: "dot.radiowaves.up.forward", colorButton: .lightGray)
    private lazy var  thirdButtonWithImage = createButton(with: "bag", colorButton: .systemBlue)
    private lazy var  fourthButtonWithImage = createButton(with: "snowflake", colorButton: .systemPurple)
    private lazy var  fifthButtonWithImage = createButton(with: "info.circle.fill", colorButton: .white)
    
    
    // MARK: - StackView
    
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.spacingBetweenBlocks
        
        return stackView
    }()
    
    private lazy var firstStackView = createVerticalStackView()
    private lazy var imageAndFirstStackView = createHorizontalStackView()
    
    private lazy var secondBlockStackView = createVerticalStackView()
    private lazy var imagesStackView = createHorizontalStackView()
    private lazy var buttonsStackView = createHorizontalStackView()
    
    private lazy var thirdBlockStackView = createHorizontalStackView()
    private lazy var leftButtons = createVerticalStackView()
    private lazy var rightButtons = createVerticalStackView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        personalImage.layer.masksToBounds = true
        personalImage.layer.cornerRadius = personalImage.frame.width / 2
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(parentStackView)
        
        parentStackView.addArrangedSubview(imageAndFirstStackView)
        
        //THIRST BLOCK
        imageAndFirstStackView.addArrangedSubview(personalImage)
        imageAndFirstStackView.addArrangedSubview(firstStackView)
        imageAndFirstStackView.spacing = Metric.spacingBetweenRowsAndImage
        imageAndFirstStackView.distribution = .fill
        
        firstStackView.addArrangedSubview(fullNameLabel)
        firstStackView.addArrangedSubview(setupStatusLabel)
        firstStackView.addArrangedSubview(setupStatus)
        firstStackView.alignment = .leading
        firstStackView.spacing = Metric.spacingBetweenRowsInPersonalInfo
        firstStackView.distribution = .fillProportionally
        
        //SECOND BLOCK
        parentStackView.addArrangedSubview(secondBlockStackView)
        
        secondBlockStackView.addArrangedSubview(editButton)
        secondBlockStackView.addArrangedSubview(imagesStackView)
        secondBlockStackView.addArrangedSubview(buttonsStackView)
        secondBlockStackView.spacing = Metric.spacingBetweenRowsInSecondStackView
        
        imagesStackView.addArrangedSubview(historyImage)
        imagesStackView.addArrangedSubview(recordImage)
        imagesStackView.addArrangedSubview(photoImage)
        imagesStackView.addArrangedSubview(videoImage)
        
        buttonsStackView.addArrangedSubview(historyButton)
        buttonsStackView.addArrangedSubview(recordButton)
        buttonsStackView.addArrangedSubview(photoButton)
        buttonsStackView.addArrangedSubview(videoButton)
        
        //THIRD BLOCK
        parentStackView.addArrangedSubview(thirdBlockStackView)
        thirdBlockStackView.addArrangedSubview(leftButtons)
        thirdBlockStackView.addArrangedSubview(rightButtons)
        thirdBlockStackView.spacing = Metric.spacingBetweenColumsInThirdStackView
        thirdBlockStackView.alignment = .leading
        thirdBlockStackView.distribution = .fillProportionally
        
        leftButtons.addArrangedSubview(firstButtonWithImage)
        leftButtons.addArrangedSubview(secondButtonWithImage)
        leftButtons.addArrangedSubview(thirdButtonWithImage)
        leftButtons.addArrangedSubview(fourthButtonWithImage)
        leftButtons.addArrangedSubview(fifthButtonWithImage)
        leftButtons.alignment = .leading
        leftButtons.spacing = Metric.spacingBetweenRowsInImageButtonsStackView
        leftButtons.distribution = .fillEqually
        
        rightButtons.addArrangedSubview(firstButtonWithTitle)
        rightButtons.addArrangedSubview(secondButtonWithTitle)
        rightButtons.addArrangedSubview(thirdButtonWithTitle)
        rightButtons.addArrangedSubview(fourthButtonWithTitle)
        rightButtons.addArrangedSubview(fifthButtonWithTitle)
        rightButtons.alignment = .leading
        rightButtons.spacing = Metric.spacingBetweenRowsInTitleButtonsStackView
        rightButtons.distribution = .fillEqually
        
    }
    
    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    // MARK: - Private methods
    
    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }
    
    private func createVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    private func createButton(with title: String, backGroundColor: UIColor) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = backGroundColor
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        
        return button
    }
    
    private func createButton(with systemImageName: String, colorButton: UIColor) -> UIButton {
        let button = UIButton()
        let image = UIImage(systemName: systemImageName)
        
        button.setImage(image, for: .normal)
        button.tintColor = colorButton
        
        return button
    }
    
    private func createButtonWithTitle(title: String, titleColor: UIColor, weight: UIFont.Weight) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: weight)
        
        return button
    }
}

// MARK: - Constants

extension ViewController {
    
    enum Metric {
        static let spacingBetweenBlocks: CGFloat = 30
        static let spacingBetweenRowsInPersonalInfo: CGFloat = 5
        static let spacingBetweenRowsAndImage: CGFloat = 10
        static let spacingBetweenRowsInSecondStackView: CGFloat = 10
        static let spacingBetweenColumsInThirdStackView: CGFloat = 0
        static let spacingBetweenRowsInImageButtonsStackView: CGFloat = 18
        static let spacingBetweenRowsInTitleButtonsStackView: CGFloat = 10
        
    }
}


