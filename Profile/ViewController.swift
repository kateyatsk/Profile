//
//  ViewController.swift
//  Profile
//
//  Created by Екатерина Яцкевич on 9.03.25.
//

import UIKit

final class ViewController: UIViewController {

    lazy var screenWidth = view.frame.size.width
    lazy var offset: CGFloat = 30
    
    lazy var descriptionPlaceholder = createPlaceholder(text: "Добавить описание", offsetY: profileIcon.frame.maxY + 52)
    lazy var passwordPlaceholder = createPlaceholder(text: "Изменить пароль", offsetY: descriptionTextView.frame.maxY + 33)
    
    lazy var oldPassword = createTextField(offsetY: passwordPlaceholder.frame.maxY + 9, placeholder: "Старый пароль")
    lazy var newPassword = createTextField(offsetY: oldPassword.frame.maxY + 14, placeholder: "Новый пароль")
    
    lazy var headerView: UIImageView = {
        $0.frame.size = CGSize(width: screenWidth, height: 156)
        $0.frame.origin = CGPoint(x: 0, y: 0)
        $0.image = .header
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var profileIcon: UIImageView = {
        $0.frame.size = CGSize(width: 100, height: 100)
        $0.frame.origin = CGPoint(x: offset, y: headerView.frame.maxY + 33)
        $0.image = .profileIcon
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.frame.size.width / 2
        return $0
    }(UIImageView())
    
    lazy var fullName: UILabel = {
        $0.frame.size = CGSize(width: 147, height: 19)
        $0.frame.origin = CGPoint(x: profileIcon.frame.maxX + offset, y: profileIcon.frame.minY + 19)
        $0.text = "Имя Фамилия"
        $0.font = .systemFont(ofSize: 16, weight: .black)
        return $0
    }(UILabel())
    
    lazy var editButton: UIButton = {
        $0.frame.size = CGSize(width: 147, height: 34)
        $0.frame.origin = CGPoint(x: profileIcon.frame.maxX + offset, y: fullName.frame.maxY + 9)
        $0.setTitle("редактировать", for: .normal)
        $0.backgroundColor = .buttonBlue
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton())
   
    lazy var descriptionTextView: UITextView = {
        $0.frame.size = CGSize(width: screenWidth - 2 * offset, height: 150)
        $0.frame.origin = CGPoint(x: offset, y: descriptionPlaceholder.frame.maxY + 9)
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.backgroundColor = .grayTextBackground
        $0.layer.cornerRadius = 20
        return $0
    }(UITextView())
    
    lazy var saveButton: UIButton = {
        $0.frame.size = CGSize(width: screenWidth - 2 * offset, height: 55)
        $0.frame.origin = CGPoint(x: offset, y: view.frame.maxY - $0.frame.size.height - 38)
        $0.setTitle("Coхранить", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.backgroundColor = .buttonBlue
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(
            headerView,
            profileIcon,
            fullName,
            editButton,
            descriptionPlaceholder,
            descriptionTextView,
            passwordPlaceholder,
            oldPassword,
            newPassword,
            saveButton
        )
    }

    private func createPlaceholder(text: String, offsetY: CGFloat) -> UILabel {
        let label = UILabel()
        label.frame.size = CGSize(width: screenWidth - 60, height: 19)
        label.frame.origin = CGPoint(x: offset, y: offsetY)
        label.text = text
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }
    
    private func createTextField(offsetY: CGFloat, placeholder: String) -> UITextField{
        let textField = UITextField()
        textField.frame.size = CGSize(width: screenWidth - 2 * offset, height: 52)
        textField.frame.origin = CGPoint(x: offset, y: offsetY)
        textField.backgroundColor = .grayTextBackground
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 21, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 21, height: 0))
        textField.rightViewMode = .always
        return textField
    }

}


extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach{addSubview($0)}
    }
}
