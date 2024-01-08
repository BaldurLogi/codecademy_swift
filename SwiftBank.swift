// Write your code below 🏦

struct SwiftBank {
  private let password: String
  private(set) var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
  static let depositBonusRate = 0.01

  init(password: String, initialDeposit: Double) {
    self.password = password
    makeDeposit(depositAmount: initialDeposit)
    
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    if enteredPassword == self.password {
      return true
    } else {
      return false
    }
  }

  private func finalDepositWithBonus(deposit fromInitialDeposit: Double) -> Double {
    return fromInitialDeposit + fromInitialDeposit * SwiftBank.depositBonusRate
  }

  mutating func makeDeposit(depositAmount ofAmount: Double) {
    let depositWithBonus = finalDepositWithBonus(deposit: ofAmount)
    print("Making a deposit of $\(ofAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus).")
    balance += depositWithBonus
  }

  func displayBalance(password usingPassword: String) {
    if !isValid(usingPassword) {
      print("Error: Invalid password. Cannot retrieve balance.")
      return 
    } else {
      print("Your current balance is $\(balance)")
    }
  }

  mutating func makeWithdrawal(withdrawalAmount ofAmount: Double, password usingPassword: String) {
    if !isValid(usingPassword) {
      print("Error: Invalid password. Cannot make balance.")
      return 
    } else {
      balance -= ofAmount
      print("Making a $\(ofAmount) withdrawal")
    }
  }

  private func displayLowBalanceMessage() {
    print("Alert: Your balance is under $100")
  }
}


var myAccount = SwiftBank(password: "qwer1234", initialDeposit: 500)
myAccount.makeDeposit(depositAmount: 50)
myAccount.makeWithdrawal(withdrawalAmount: 100, password: "qwer1234")
myAccount.displayBalance(password: "qwer1234")


/*
18.
Build a new feature that only gives the deposit bonus the first time a user makes a deposit of $1000 or more.

19.
There are a few conditions we haven’t addressed in our code that could cause some problems for the users and the bank. What if the user tries to:

Deposit a negative amount
Deposit a zero amount
Withdraw a negative amount
Withdraw a zero amount
Withdraw more cash than they have in the bank
Create logic that addresses these five scenarios.
*/
