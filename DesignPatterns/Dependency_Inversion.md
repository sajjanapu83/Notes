
## Interface ( IProductRepository )
```ruby
using System;
using System.Collections.Generic;
namespace GangOfFour
{
    public interface IProductRepository
    {
        public List<string> GetAllProductNames();
    }    
}
```
## SQLProductCategory ( Implement Logic )
```ruby
namespace GangOfFour
{
    public class SQLProductRepository: IProductRepository
    {
        public SQLProductRepository()
        {
        }
        public List<string> GetAllProductNames()
        {
            List<string> productNames = new List<string>();
            productNames.Add("Infant");
            productNames.Add("Toddler");
            return productNames;
        }
    }
}
```
