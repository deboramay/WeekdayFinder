//
//  ViewController.swift
//  Weekday Finder
//
//  Created by Anastasia on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var dateTF: UITextField!
  @IBOutlet weak var monthTF: UITextField!
  @IBOutlet weak var yearTF: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  @IBAction func findDay(_ sender: Any) {
    //проверка непустого поля
    guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
    
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    dateComponents.day = Int(day)
    dateComponents.month = Int(month)
    dateComponents.year = Int(year)
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_Ru")
    //в каком формате отображать день недели
    dateFormatter.dateFormat = "EEEE"
    
    guard let date = calendar.date(from: dateComponents) else { return }
    
    let weekday = dateFormatter.string(from: date)
    //с большой буквы
    let capitalizedWeekday = weekday.capitalized
    
    resultLabel.text = capitalizedWeekday
    
  }
  //пропадает клавиатура при тапании в любом месте экрана
  override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?) {
    self.view.endEditing(true)
  }
  
}

