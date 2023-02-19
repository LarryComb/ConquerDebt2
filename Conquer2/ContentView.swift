//
//  Conquer2App.swift
//  Conquer2
//
//  Created by LARRY COMBS on 2/18/23.
//
import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let debtInputView = UIView()
    let amountTextField = UITextField()
    let datepicker = UIDatePicker()
    let submitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(tableView)

        // Set up table view constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Set up debt input view
        debtInputView.backgroundColor = .gray
        view.addSubview(debtInputView)

        // Set up debt input view constraints
        debtInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            debtInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            debtInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            debtInputView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            debtInputView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Set up amount text field
        amountTextField.placeholder = "Enter amount"
        amountTextField.borderStyle = .roundedRect
        debtInputView.addSubview(amountTextField)

        // Set up date picker
        datepicker.datePickerMode = .date
        debtInputView.addSubview(datepicker)

        // Set up submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        debtInputView.addSubview(submitButton)

        // Set up constraints for amount text field, date picker, and submit button
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        datepicker.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amountTextField.leadingAnchor.constraint(equalTo: debtInputView.leadingAnchor, constant: 16),
            amountTextField.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
            amountTextField.widthAnchor.constraint(equalToConstant: 150),

            datepicker.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 16),
            datepicker.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),

            submitButton.leadingAnchor.constraint(equalTo: datepicker.trailingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: debtInputView.trailingAnchor, constant: -16),
            submitButton.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
        ])

        // Set up test button
        let testButton = UIButton()
        testButton.setTitle("Test Button", for: .normal)
        testButton.setTitleColor(.black, for: .normal)
        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)

        debtInputView.addSubview(testButton)

        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: debtInputView.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
        ])
    }

    @objc func testButtonTapped() {
        print("Test button tapped")
    }

}
