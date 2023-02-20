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
    let addItemButton = UIButton()
    
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
        amountTextField.keyboardType = .numberPad
        debtInputView.addSubview(amountTextField)
        
        // Set up date picker
        datepicker.datePickerMode = .date
        debtInputView.addSubview(datepicker)
        
        // Set up submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        debtInputView.addSubview(submitButton)
        
        // Set up add item button
        addItemButton.setTitle("Add Item", for: .normal)
        addItemButton.setTitleColor(.black, for: .normal)
        addItemButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)
        debtInputView.addSubview(addItemButton)
        
        // Set up constraints for amount text field, date picker, submit button, and add item button
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        datepicker.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amountTextField.leadingAnchor.constraint(equalTo: debtInputView.leadingAnchor, constant: 16),
            amountTextField.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
            amountTextField.widthAnchor.constraint(equalToConstant: 150),
            
            datepicker.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 16),
            datepicker.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
            
            submitButton.leadingAnchor.constraint(equalTo: datepicker.trailingAnchor, constant: 16),
            submitButton.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
            
            addItemButton.trailingAnchor.constraint(equalTo: debtInputView.trailingAnchor, constant: -16),
            addItemButton.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor)
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
    
    @objc func submitButtonTapped() {
        print("Submit button tapped")
        // Retrieve the amount from the text field
        if let amount = amountTextField.text {
            print("Amount: \(amount)")
        }
    }
    
    @objc func addDebtButtonTapped() {
        print("Add debt button tapped")
        let newDebtInputView = UIView()
        
        // Add new debt item to table view
        let debtItem = DebtItem(amount: value, date: datepicker.date)
        debtItems.append(debtItem)
        tableView.reloadData()
        
        // Clear amount text field
        amountTextField.text = nil
    }
    
    @objc func addDebtInputViewTapped() {
        // Create new debt input view
        let newDebtInputView = UIView()
        newDebtInputView.backgroundColor = .gray
        view.addSubview(newDebtInputView)
        
        // Set up debt input view constraints
        newDebtInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newDebtInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newDebtInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newDebtInputView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        if let previousDebtInputView = view.subviews.last(where: { $0 is DebtInputView }) {
            // Set up constraints for new debt input view below previous debt input view
            NSLayoutConstraint.activate([
                newDebtInputView.topAnchor.constraint(equalTo: previousDebtInputView.bottomAnchor)
            ])
        } else {
            // Set up constraints for new debt input view at top of view
            NSLayoutConstraint.activate([
                newDebtInputView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            ])
        }
        
        // Set up amount text field, date picker, and submit button for new debt input view
        let newAmountTextField = UITextField()
        newAmountTextField.placeholder = "Enter amount"
        newAmountTextField.borderStyle = .roundedRect
        newAmountTextField.keyboardType = .numberPad
        newDebtInputView.addSubview(newAmountTextField)
        
        let newDatepicker = UIDatePicker()
        newDatepicker.datePickerMode = .date
        newDebtInputView.addSubview(newDatepicker)
        
        let newSubmitButton = UIButton()
        newSubmitButton.setTitle("Submit", for: .normal)
        newSubmitButton.setTitleColor(.black, for: .normal)
        newSubmitButton.addTarget(self, action: #selector(newSubmitButtonTapped), for: .touchUpInside)
        newDebtInputView.addSubview(newSubmitButton)
        
        newAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        newDatepicker.translatesAutoresizingMaskIntoConstraints = false
        newSubmitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newAmountTextField.leadingAnchor.constraint(equalTo: newDebtInputView.leadingAnchor, constant: 16),
            newAmountTextField.centerYAnchor.constraint(equalTo: newDebtInputView.centerYAnchor),
            newAmountTextField.widthAnchor.constraint(equalToConstant: 150),
            
            newDatepicker.leadingAnchor.constraint(equalTo: newAmountTextField.trailingAnchor, constant: 16),
            newDatepicker.centerYAnchor.constraint(equalTo: newDebtInputView.centerYAnchor),
            
            newSubmitButton.leadingAnchor.constraint(equalTo: newDatepicker.trailingAnchor, constant: 16),
            newSubmitButton.trailingAnchor.constraint(equalTo: newDebtInputView.trailingAnchor, constant: -16),
            newSubmitButton.centerYAnchor.constraint(equalTo: newDebtInputView.centerYAnchor),
        ])
    }
    
    @objc func newSubmitButtonTapped(sender: UIButton) {
        guard let debtInputView = sender.superview, let amountTextField = debtInputView.subviews.first(where: { $0 is UITextField }) as? UITextField, let amount = amountTextField.text, let value = Double(amount) else {
            print("Invalid debt input view")
            return
        }
        @objc func addInputFieldButtonTapped() {
            let inputView = UIView()
            inputView.backgroundColor = .gray
            debtInputView.addSubview(inputView)
            
            // Set up constraints for input view
            inputView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                inputView.leadingAnchor.constraint(equalTo: debtInputView.leadingAnchor),
                inputView.trailingAnchor.constraint(equalTo: debtInputView.trailingAnchor),
                inputView.heightAnchor.constraint(equalToConstant: 100),
                inputView.topAnchor.constraint(equalTo: latestInputView.bottomAnchor, constant: 8)
            ])
            
            // Set up amount text field
            let amountTextField = UITextField()
            amountTextField.placeholder = "Enter amount"
            amountTextField.borderStyle = .roundedRect
            amountTextField.keyboardType = .numberPad
            inputView.addSubview(amountTextField)
            
            // Set up date picker
            let datepicker = UIDatePicker()
            datepicker.datePickerMode = .date
            inputView.addSubview(datepicker)
            
            // Set up constraints for amount text field and date picker
            amountTextField.translatesAutoresizingMaskIntoConstraints = false
            datepicker.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                amountTextField.leadingAnchor.constraint(equalTo: inputView.leadingAnchor, constant: 16),
                amountTextField.centerYAnchor.constraint(equalTo: inputView.centerYAnchor),
                amountTextField.widthAnchor.constraint(equalToConstant: 150),
                
                datepicker.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 16),
                datepicker.centerYAnchor.constraint(equalTo: inputView.centerYAnchor),
                datepicker.trailingAnchor.constraint(equalTo: inputView.trailingAnchor, constant: -16)
            ])
            
            // Set latest input view to the new input view
            latestInputView = inputView
        }
        
        @objc func submitButtonTapped() {
            // Calculate total debt and log it to the console
            var totalDebt = 0
            for inputView in debtInputView.subviews {
                if let amountTextField = inputView.subviews.first(where: { $0 is UITextField }) as? UITextField,
                   let amountText = amountTextField.text,
                   let amount = Int(amountText) {
                    totalDebt += amount
                }
            }
            
            print("Total debt: $\(totalDebt)")
        }
    }

