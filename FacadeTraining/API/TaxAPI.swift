//
//  TaxAPI.swift
//  FacadeTraining
//
//  Created by Lorena Mrsic on 30/03/2021.
//

import Foundation

class TaxAPI {
  static var shared = TaxAPI()
  
  init(){
    
  }
  
  private let taxCalculation = TaxCalculation()
  
  
  // MARK: - Public methods
  
  func calculateTaxForSubtotal(_ subtotal: Int32, andState state: State) -> Int32 {
    taxCalculation.calculateTaxForSubtotal(subtotal, andState: state)
  }
}
