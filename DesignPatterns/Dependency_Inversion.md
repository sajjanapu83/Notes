
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
## SQLProductRepository ( Implement Interface Logic )
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
## Object Creation
```ruby
using System;
namespace GangOfFour
{
    public class ProductFactory
    {
        public ProductFactory()
        {
        }
        public static IProductRepository create()
        {
            return new SQLProductRepository();
        }
    }
}
```
