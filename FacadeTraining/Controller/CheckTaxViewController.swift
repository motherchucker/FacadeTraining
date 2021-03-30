//
//  CheckTaxViewController.swift
//  FacadeTraining
//
//  Created by Lorena Mrsic on 30/03/2021.
//

import UIKit

class CheckTaxViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
  
  var statesArray = [State]()
  
  private var subtotal: Int32 = 0
  
  @IBOutlet weak var subtotalAmountTextField: UITextField!
  @IBOutlet weak var statePickerView: UIPickerView!
  @IBOutlet weak var taxAmountLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let texas = State(name: "Arizona", taxFraction: 5.6)
    statesArray.append(texas)
    let arkansas = State(name: "Arkansas", taxFraction: 6.5)
    statesArray.append(arkansas)
    let california = State(name: "California", taxFraction: 7.2)
    statesArray.append(california)
    }
  
  // MARK: - UIPickerViewDataSource
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return statesArray.count
  }
  
  // MARK: - UIPickerViewDelegate
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return statesArray[row].name
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let selectedState = statesArray[row]
    let tax = TaxAPI.shared.calculateTaxForSubtotal(subtotal, andState: selectedState)
    
    taxAmountLabel.text = String.formattedCurrencyStringFromCents(tax)
  }

  // MARK: - UITextFieldDelegate
  
  func textFieldDidEndEditing(_ textField: UITextField) {
//
    if let subtotal = Int32(subtotalAmountTextField.text ?? "") {
      self.subtotal = subtotal
      textField.text = String.formattedCurrencyStringFromCents(subtotal)
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print(string)
    if string == "" {
      subtotal = Int32(String("\(subtotal)".dropLast())) ?? 0
      textField.text = String.formattedCurrencyStringFromCents(subtotal)
    }
    if let subtotalString = Int(string) {
      subtotal = Int32("\(subtotal)\(subtotalString)")!
      textField.text = String(String.formattedCurrencyStringFromCents(subtotal).dropLast())
      
      return true
    } else {
      return false
    }
  }

  
}
