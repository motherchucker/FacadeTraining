//
//  String+Extensions.swift
//  FacadeTraining
//
//  Created by Lorena Mrsic on 30/03/2021.
//

import Foundation

extension String {

  static func formattedCurrencyStringFromCents(_ cents: Int32) -> String {
    let amount = Double(cents) / 100
    var decimalValue = Decimal(amount)
    var roundedDecimalValue = Decimal()
    NSDecimalRound(&roundedDecimalValue, &decimalValue, 2, .bankers)
    let roundedValue = NSDecimalNumber(decimal: roundedDecimalValue).doubleValue
    if roundedValue >= 0 {
      return String(format: "$%.02f", locale: Locale.current, arguments: [roundedValue])
    } else {
      return String(format: "-$%.02f", locale: Locale.current, arguments: [abs(roundedValue)])
    }
  }
}

