
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
## Implement Interface Logic ( SQLProductRepository )
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
## Object Creation ( ProductFactory )
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
## FrontEnd Display Logic 
```ruby
using System;
namespace GangOfFour
{
    public class ProductCatalog
    {
        private IProductRepository _productRepository;
        public ProductCatalog(IProductRepository _productRepository)
        {
            this._productRepository = _productRepository;
        }
        public void displayProducts()
        {
            foreach (string name in _productRepository.GetAllProductNames())
            {
                Console.WriteLine(name.ToString());
            }
        }
    }

}
```
## Client Program
using System;
namespace GangOfFour
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("==> DEPENDENCY INVERSION *****");

            IProductRepository productRepository = ProductFactory.create();

            ProductCatalog catalog = new ProductCatalog(productRepository);
            catalog.displayProducts();
            /* 
             * Inversion Of Control (IoC)
             *  https://stackoverflow.com/questions/3058/what-is-inversion-of-control
             */
        }
    }
}
