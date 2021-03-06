//
//  LaunchController.swift
//  GB-Vkontakte
//
//  Created by Vitalik on 17.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var labelVK: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Actions
    
    // кнопка
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        //присваиваем его scrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    // переопределяем метод проверки логина и пароля
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //  проверка введеннх данных
        let checkUserName = checkUserData()
        // вывод ошибки, если ввод неверный
        if !checkUserName {
            showIdentError()
        }
        //  возврат результата
        return checkUserName
    }
    
    // функция проверки введеныых данных
    func checkUserData() -> Bool {
        guard let login = userNameTextField.text,
            let password = passwordTextField.text else {return false}
        
        if login == "admin" && password == "12345" {
            return true
        } else {
            passwordTextField.text = ""
            return false
        }
    }
    
    // функция показа сообщения об ошибке
    func showIdentError() {
        // создаем алерт для предупреждения о неверном вводе
        let alertWIndow = UIAlertController(title: "Warning!", message: "Invalid username or passsword", preferredStyle: .alert)
        // кнопка для UIAlertController
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        // добавляем кнопку на UIAlertController
        alertWIndow.addAction(actionButton)
        // показываем UIAlertController
        present(alertWIndow, animated: true, completion: nil)
    }
    
    //MARK: - LIfe cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // подписываемся на уведомление при появление клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // уведомление при пропадании клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Keyboard
    
    // после появления клавиатуры
    @objc func keyboardWasShown(notification: Notification) {
        
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey:
            UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // добавляем отступ внизу UIScrollView,  равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // после исчезновения клавиатуры
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        // устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // исчезновение клавиатуры при клике по месту на экране
    @objc func hideKeyBoard() {
        self.scrollView?.endEditing(true)
    }
    
    //MARK: - Segues
    
    // метод для перехода на стартовый экран с очисткой полей логина и пароля
    @IBAction func myUNwindAction(unwindSegue: UIStoryboardSegue){
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
