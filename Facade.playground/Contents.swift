class Bank
{
    func HasSufficientSavings(c: Customer, amount: Int) -> Bool
        {
            print("Check bank for " + c.Name)
            return true
        }
}
class Credit
{
    func HasGoodCredit(c: Customer) -> Bool
    {
        print("Check credit for " + c.Name)
        return true
    }
}

class Loan
{
    func HasNoBadLoans(c: Customer) -> Bool
    {
        print("Check loans for " + c.Name)
        return true
    }
}
class Customer
{
    private var m_name: String?
    
    init(name: String)
    {
        self.m_name = name
    }
    var Name: String {
                get{return self.m_name!}
            }
}
public class Mortgage
{
    var bank: Bank      =  Bank()
    var loan: Loan      = Loan()
    var credit: Credit  = Credit()
    func IsEligible(cust: Customer , amount: Int ) -> Bool
    {
        print("\(cust.Name) applies for \(amount) loan\n")
        var eligible: Bool = true
        // Check creditworthyness of applicant
        if (!bank.HasSufficientSavings(c: cust, amount: amount))
        {
            eligible = false;
        }
        else if (!loan.HasNoBadLoans(c: cust))
        {
            eligible = false;
        }
        else if (!credit.HasGoodCredit(c: cust))
        {
            eligible = false;
        }
        return eligible;
    }
}

var mortgage: Mortgage  =  Mortgage()
// Evaluate mortgage eligibility for customer
var customer: Customer  = Customer(name: "Ann McKinsey")
var eligible: Bool = mortgage.IsEligible(cust: customer, amount: 125000)
print("\n" + customer.Name +
        " has been " + (eligible ? "Approved" : "Rejected"))

