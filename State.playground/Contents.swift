
        // The 'State' "abstract" class

        class State
        {
            internal var account: Account
            internal var balance: Double
            
            internal var interest: Double
            internal var lowerLimit: Double
            internal var upperLimit: Double
            
            // Properties
            var Account: Account
            {
                get { return account }
                set { account = newValue }
            }
            var Balance: Double
            {
                get { return balance }
                set { balance = newValue }
            }
            
            private init(){}
            func deposit(amount: Double){fatalError("Not implemented")}
            func withdraw(amount: Double){fatalError("Not implemented")}
            func payInterest(){fatalError("Not implemented")}
        }

         // A 'ConcreteState' class
        // Red indicates that account is overdrawn

        class RedState : State
            
        {
            private var _serviceFee: Double
            
            // Constructor
            
            init(state: State )
            {
                self.balance = state.Balance
                self.account = state.Account
                initialize()
            }
            
            private func initialize()
            {
                interest = 0.0;
                lowerLimit = -100.0;
                upperLimit = 0.0;
                _serviceFee = 15.00;
            }
            
            override func deposit(amount: Double )
            {
                balance += amount
                StateChangeCheck()
            }
            
            override func withdraw(amount: Double )
            {
                balance = amount - _serviceFee
                print("No funds available for withdrawal!")
            }
            
            override func payInterest()
            {
                // No interest is paid
            }
            
            private func StateChangeCheck()
            {
                if (balance > upperLimit)
                {
                    account.State =  SilverState(self)
                }
            }
        }

         // A 'ConcreteState' class
        // Silver indicates a non-interest bearing state

        
        class SilverState : State
            
        {
            // Overloaded constructors
            init(state: State )
            {
                self(state.Balance, state.Account)
            }
            
            init(balance: double , account: Account)
            {
                self.balance = balance
                self.account = account
                initialize()
            }
            
            private func initialize()
            {
                interest = 0.0
                lowerLimit = 0.0
                upperLimit = 1000.0
            }
            
            public override void Deposit(double amount)
        {
            balance += amount;
            StateChangeCheck();
            }
            
            public override void Withdraw(double amount)
        {
            balance -= amount;
            StateChangeCheck();
            }
            
            public override void PayInterest()
        {
            balance += interest * balance;
            StateChangeCheck();
            }
            
            private void StateChangeCheck()
        {
            if (balance < lowerLimit)
            {
            account.State = new RedState(this);
            }
            else if (balance > upperLimit)
            {
            account.State = new GoldState(this);
            }
            }
        }
        
        /// <summary>
        
        /// A 'ConcreteState' class
        
        /// <remarks>
        
        /// Gold indicates an interest bearing state
        
        /// </remarks>
        
        /// </summary>
        
        class GoldState : State
            
        {
            // Overloaded constructors
            
            public GoldState(State state)
            : this(state.Balance, state.Account)
            {
            }
            
            public GoldState(double balance, Account account)
        {
            this.balance = balance;
            this.account = account;
            Initialize();
            }
            
            private void Initialize()
        {
            // Should come from a database
            
            interest = 0.05;
            lowerLimit = 1000.0;
            upperLimit = 10000000.0;
            }
            
            public override void Deposit(double amount)
        {
            balance += amount;
            StateChangeCheck();
            }
            
            public override void Withdraw(double amount)
        {
            balance -= amount;
            StateChangeCheck();
            }
            
            public override void PayInterest()
        {
            balance += interest * balance;
            StateChangeCheck();
            }
            
            private void StateChangeCheck()
        {
            if (balance < 0.0)
            {
            account.State = new RedState(this);
            }
            else if (balance < lowerLimit)
            {
            account.State = new SilverState(this);
            }
            }
        }

        
        class Account
            
        {
            private var _state: State
            private var _owner: String
            
            // Constructor
            
            init (owner: String )
            {
                // New accounts are 'Silver' by default
                self._owner = owner
                self._state = SilverState(0.0, self)
            }
            
            // Properties
            
            var Balance : Double
            {
                get { return _state.Balance }
            }
            
            var  State: State
            {
                get { return _state }
                set { _state = newValue }
            }
            
            func deposit(amount: Double )
            {
                _state.deposit(amount)
                print("Deposited {0:C} --- ", amount)
                print(" Balance = {0:C}", self.Balance)
                print(" Status = {0}",
                type(of: self.State))
                print("")
            }
            
            func withdraw(amount: Double)
            {
                _state.withdraw(amount)
                print("Withdrew {0:C} --- ", amount)
                print(" Balance = {0:C}", self.Balance)
                print(" Status = {0}\n",
                type(of: self.State))
            }
            func payInterest()
            {
                _state.payInterest()
                print("Interest Paid --- ")
                print(" Balance = {0:C}", self.Balance)
                print(" Status = {0}\n",
                type(of: self.State))
            }
        }

 var account: Account  = Account("Jim Johnson")

// Apply financial transactions

account.deposit(amount: 500.0)
account.deposit(amount: 300.0)
account.deposit(amount: 550.0)
account.payInterest()
account.withdraw(amount: 2000.00)
account.withdraw(amount: 1100.00)
