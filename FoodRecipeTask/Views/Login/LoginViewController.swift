//
//  LoginViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 10/05/2021.
//

import UIKit
import JGProgressHUD

class LoginViewController: UIViewController {
    
    // variables
    var passwordVisibility: (UIButton, String)?
    var presenter: LoginPresenter?
    private let spinner = JGProgressHUD(style: .dark)
    
    
    
    // outlets
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    // constraints outlets
//    @IBOutlet weak var scrollViewTop: NSLayoutConstraint!
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        configureUI()
        
        presenter = LoginPresenter(view: self)
        
    }
    

    
    init() {
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI(){
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.backgroundColor = MainColors.primaryColor
        welcomeBackLabel.setTextWithAnimation(text: "Welcome back!")
        
        

        
        emailTextField.insertPadding()
        passwordTextField.insertPadding()
        
        passwordVisibility = PasswordVisibility.insertEyeIcon(textfield: passwordTextField, systemImage: "eye.slash")
        
        passwordVisibility?.0.addTarget(self, action: #selector(showPasswordTapped), for: .touchUpInside)
        
        
        signupButton.layer.borderWidth = 2
        signupButton.layer.borderColor = MainColors.primaryColor.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
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
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        let foodSearchViewController = FoodSearchViewController()
        presenter?.emailPasswordLogin(email: emailTextField.text, password: passwordTextField.text, isFinishCompletion: { (isFinish) in
            if isFinish{
                self.navigationController?.pushViewController(foodSearchViewController, animated: true)
            }
        })
    }
    
    
    @IBAction func forgetPasswordTapped(_ sender: Any) {
        
        ShowAlert.instance.showForgetPasswordAlert(title: nil, message: "", style: .alert, view: self) { [self] (isFinish, email) in
            presenter?.resetPassword(email: email, isFinishCompletion: { (isFinish) in
                print("No Error")
            })
        }
        
    }
    
    
    @IBAction func signupTapped(_ sender: Any) {
        
        let signupViewController = SignupViewController()
        
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
    
}



extension LoginViewController: LoginView{
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
