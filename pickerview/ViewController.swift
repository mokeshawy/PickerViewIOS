//
//  ViewController.swift
//  pickerview
//
//  Created by Mohamed Keshawy on 10/05/2025.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
    UIPickerViewDelegate
{

    @IBOutlet weak var PickerView: UIPickerView!

   
    @IBOutlet weak var PickerViewTwo: UIPickerView!
    
    @IBOutlet weak var LiDisplay: UILabel!

    private var accountList: [String] = ["Admin", "User", "Guest", "Manager"]

    private var users: [String] = ["Mohamed", "Anas", "Keshawy", "Omar"]

    private var optionList: [String] = ["Option 1", "Option 2", "Option 3"]

    private var selectedAccount: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        initPickerView()
        
        
    }

    func initPickerView() {
        PickerView.delegate = self
        PickerView.dataSource = self
        PickerViewTwo.delegate = self
        PickerViewTwo.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return if pickerView.tag == 0 {
             2
        } else {
            1
        }
    }

    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        if pickerView.tag == 0 {
            return accountList.count
        } else {
            return optionList.count
        }
    }

    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        if pickerView.tag == 0 {
           return if component == 0 {
                accountList[row]
            } else {
                users[row]
            }
        } else {
          return optionList[row]
        }
    }

    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {

        if pickerView.tag == 0 {

            if component == 0 {
                LiDisplay.text = "Selected Account : \(accountList[row])"
                self.selectedAccount = accountList[row]
            } else {
                LiDisplay.text = "Selected User : \(users[row])"
                self.selectedAccount = users[row]
            }
        }else{
            LiDisplay.text = "Selected Option : \(optionList[row])"
            self.selectedAccount = optionList[row]
        }

        print("Selected Item: \(selectedAccount)")
    }
}
