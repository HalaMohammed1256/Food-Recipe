//
//  SignupViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 10/05/2021.
//

import UIKit
import JGProgressHUD

class SignupViewController: UIViewController {
    
    // variables
    var passwordVisibility: (UIButton, String)?
    var confirmPasswordVisibility: (UIButton, String)?
    var presenter: SignupPresenter?
    private let spinner = JGProgressHUD(style: .dark)
    
    
    // outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setToolbarHidden(true, animated: true)
        presenter = SignupPresenter.init(view: self)
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    
    //HalaMohammed1245@gmail.com
    
    
    init() {
        super.init(nibName: "SignupViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureUI(){
        
        view.backgroundColor = MainColors.primaryColor
        welcomeLabel.setTextWithAnimation(text: "Sign up")
        
        
        usernameTextField.insertPadding()
        emailTextField.insertPadding()
        passwordTextField.insertPadding()
        confirmPasswordTextField.insertPadding()
        
        passwordVisibility = PasswordVisibility.insertEyeIcon(textfield: passwordTextField, systemImage: "eye.slash")
        passwordVisibility?.0.addTarget(self, action: #selector(showPasswordTapped), for: .touchUpInside)
        
        
        confirmPasswordVisibility = PasswordVisibility.insertEyeIcon(textfield: confirmPasswordTextField, systemImage: "eye.slash")
        confirmPasswordVisibility?.0.addTarget(self, action: #selector(showConfirmPasswordTapped), for: .touchUpInside)
        
        
    }

    
    // Actions
    
    @objc func showPasswordTapped(){
        
        if passwordVisibility?.1 == "eye.slash"{
            
            passwordVisibility = PasswordVisibility.insertEyeIcon(textfield: passwordTextField, systemImage: "eye")
            passwordVisibility?.0.addTarget(self, action: #selector(showPasswordTapped), for: .touchUpInside)
            
        }else{
            
            passwordVisibility = PasswordVisibility.insertEyeIcon(textfield: passwordTextField, systemImage: "eye.slash")
            passwordVisibility?.0.addTarget(self, action: #selector(showPasswordTapped), for: .touchUpInside)
            
        }
    }
    
    @objc func showConfirmPasswordTapped(){
        
        if confirmPasswordVisibility?.1 == "eye.slash"{
            
            confirmPasswordVisibility = PasswordVisibility.insertEyeIcon(textfield: confirmPasswordTextField, systemImage: "eye")
            confirmPasswordVisibility?.0.addTarget(self, action: #selector(showConfirmPasswordTapped), for: .touchUpInside)
            
        }else{
            
            confirmPasswordVisibility = PasswordVisibility.insertEyeIcon(textfield: confirmPasswordTextField, systemImage: "eye.slash")
            confirmPasswordVisibility?.0.addTarget(self, action: #selector(showConfirmPasswordTapped), for: .touchUpInside)
            
        }
        
    }
    
    
    @IBAction func signupTapped(_ sender: Any) {
        
        guard let userName = usernameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else{
            return
        }
        
        let foodSearchViewController = FoodSearchViewController()
        
        
        if userName.count > 0 && email.isValidateEmail() && password.isValidatePassword() && confirmPassword == password{
            

            presenter?.emailPasswordSignup(userName: usernameTextField.text, email: emailTextField.text, password: passwordTextField.text, isFinishCompletion: { (isFinish) in
                if isFinish{
                    self.navigationController?.pushViewController(foodSearchViewController, animated: true)
                }
            })
                
        }else{
            if !email.isValidateEmail(){
                ShowAlert.instance.showAlert(title: nil, message: "Please enter a valid email", style: .actionSheet, view: self, okHandler: nil)
            }
            
            
            if !password.isValidatePassword(){
                 ShowAlert.instance.showAlert(title: nil, message: "Password must contain at least 8 characters with at least 1 Alphabet and 1 Number", style: .actionSheet, view: self, okHandler: nil)
                 
             }
            
            if confirmPassword != password{
                 ShowAlert.instance.showAlert(title: nil, message: "Confirm password doesn't equal password", style: .actionSheet, view: self, okHandler: nil)
             }
        }
        
        
    }
    

}


extension SignupViewController: SignupView{
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.spinner.show(in: self.view)
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.spinner.dismiss()
        }
    }
    
    func showDescriptionAlert(description: String) {
        ShowAlert.instance.showAlert(title: nil, message: description, style: .alert, view: self, okHandler: nil)
    }
    
    
}
