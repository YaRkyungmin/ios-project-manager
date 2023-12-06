//
//  DetailPlanViewController.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/11/29.
//

import UIKit

final class DetailPlanViewController: UIViewController {
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.backgroundColor = .systemGray4
        
        return navigationBar
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.layer.shadowColor = UIColor.systemGray.cgColor
        textField.layer.shadowOffset = CGSize(width: 2, height: 3)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 15
        textField.layer.borderWidth = 0.3
        textField.layer.borderColor = UIColor.label.cgColor
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(DetailPlanViewController.self, action: #selector(handleDatePicker(_:)), for: .editingDidEnd)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    private let detailTextView: UITextView = {
        let textView = UITextView()
        textView.text = "to do list"
        textView.font = UIFont.preferredFont(forTextStyle: .title2)
        textView.layer.shadowColor = UIColor.systemGray.cgColor
        textView.layer.shadowOffset = CGSize(width: 2, height: 3)
        textView.layer.shadowOpacity = 0.5
        textView.layer.shadowRadius = 15
        textView.layer.borderWidth = 0.3
        textView.layer.borderColor = UIColor.label.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupComponents()
        setupConstraints()
    }
    
    @objc private func handleDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
    }
}

// MARK: - ConfigureUI
extension DetailPlanViewController {
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        view.addSubview(navigationBar)
        view.addSubview(titleTextField)
        view.addSubview(datePicker)
        view.addSubview(detailTextView)
    }
}

// MARK: - SetupComponents
extension DetailPlanViewController {
    private func setupComponents() {
        setupView()
        setupNavigationBar()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        let navigationItem = UINavigationItem(title: "TODO")
        let historyButton = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(didTapLeftButton))
        let plusButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(didTapRightButton))
        navigationItem.leftBarButtonItem = historyButton
        navigationItem.rightBarButtonItem = plusButton
        
        navigationBar.setItems([navigationItem], animated: true)
    }
}

// MARK: - SetupConstraint
extension DetailPlanViewController {
    private func setupConstraints() {
        setupNavigationBarConstraint()
        setupTitleTextFieldConstraint()
        setupdatePickerConstraint()
        setupDetailTextViewConstraint()
    }
    
    private func setupNavigationBarConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func setupTitleTextFieldConstraint() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(lessThanOrEqualTo: navigationBar.bottomAnchor, constant: 10),
            titleTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97),
            titleTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupdatePickerConstraint() {
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(lessThanOrEqualTo: titleTextField.bottomAnchor, constant: 5),
            datePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97),
            datePicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupDetailTextViewConstraint() {
        NSLayoutConstraint.activate([
            detailTextView.topAnchor.constraint(lessThanOrEqualTo: datePicker.bottomAnchor, constant: 5),
            detailTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97),
            detailTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

// MARK: - ButtonAction
extension DetailPlanViewController {
    @objc private func didTapLeftButton() {
        print("didTapLeftButton")
        dismiss(animated: false)
    }
    
    @objc private func didTapRightButton() {
        print("didTapRightButton")
        dismiss(animated: false)
    }
}
