//
//  TaxCalculation.swift
//  FacadeTraining
//
//  Created by Lorena Mrsic on 30/03/2021.
//

import Foundation

class TaxCalculation {
  func calculateTaxForSubtotal(_ subtotal: Int32, andState state: State) -> Int32 {
    let subtotalDecimalNumber = NSDecimalNumber(value: subtotal)
    //let subtotalDecimalNumber = NSNumber(value: subtotal)
    let taxFractionDecimalNumber = NSDecimalNumber(value: state.taxFraction)
    let taxAmountDecimalNumber = subtotalDecimalNumber.multiplying(by: taxFractionDecimalNumber).dividing(by: 100)

    return taxAmountDecimalNumber.int32Value
  }
}
