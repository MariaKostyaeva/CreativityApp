//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CreativityApp.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Order = new HashSet<Order>();
        }
    
        public string ProductArticleNumber { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCategory { get; set; }
        public string ProductPhoto { get; set; }
        public string Image
        {
            get
            {
                if(ProductPhoto == null || ProductPhoto == "")
                {
                    ProductPhoto = "/Database/Images/Товар_import/picture.png";
                }
                return ProductPhoto;
            }
        }
        public int IdManufacturer { get; set; }
        public int IdProvider { get; set; }
        public decimal ProductCost { get; set; }
        public decimal RoundCost
        {
            get
            {
                return Math.Round(ProductCost);
            }
        }
        public Nullable<int> IdDiscount { get; set; }
        public int ProductQuantityInStock { get; set; }
        public string UnitOfMeasurement { get; set; }
        public string ProductStatus { get; set; }
    
        public virtual Discount Discount { get; set; }
        public virtual Manufacturer Manufacturer { get; set; }
        public virtual Provider Provider { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
    }
}
