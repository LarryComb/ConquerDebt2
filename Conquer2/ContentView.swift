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
    let addInputButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        

        // Set up an Add another Input field button that creates another tableView cell
        addInputButton.setTitle("Add Another Form", for: .normal)
        addInputButton.backgroundColor = .systemBlue
        tableView.addSubview(addInputButton)
        addInputButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        addInputButton.layer.cornerRadius = 25
        addInputButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        

        // Set up table view constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set table view background color and corner radius
            tableView.backgroundColor = .systemCyan
            tableView.layer.cornerRadius = 25
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)

        // Set up debt input view
        debtInputView.backgroundColor = .orange
        view.addSubview(debtInputView)

        // Set up debt input view constraints
        debtInputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            debtInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            debtInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            debtInputView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            debtInputView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        ])

        // Set up amount text field
        amountTextField.placeholder = "Enter amount"
        amountTextField.borderStyle = .roundedRect
        amountTextField.keyboardType = .numberPad // Set keyboard type to number pad
        debtInputView.addSubview(amountTextField)

        // Set up date picker
        datepicker.datePickerMode = .date
        debtInputView.addSubview(datepicker)

        // Set up submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.blue, for: .normal)
        debtInputView.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

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
        testButton.setTitleColor(.green, for: .normal)
        testButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        debtInputView.addSubview(testButton)

        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: debtInputView.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: debtInputView.centerYAnchor),
        ])

        // Set up table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        }

        }

        extension ViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1 // Each section will have only one row for the input field and add button
        }

        func numberOfSections(in tableView: UITableView) -> Int {
            return 1 // Set to 1 for simplicity
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Input field"
            return cell
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = .lightGray
            
            let addButton = UIButton(type: .contactAdd)
            addButton.tag = section // Store section in tag for later use
            addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
            headerView.addSubview(addButton)
            
            addButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            ])
            
            return headerView
        }

            @objc func addButtonTapped(sender: UIButton) {
                addInputButton.backgroundColor = .orange
            }
            
           
            

    }




