//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectDataManipulatie_DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class WedstijdProef
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WedstijdProef()
        {
            this.Resultaten = new HashSet<Resultaat>();
        }
    
        public int Id { get; set; }
        public int proefCategorieId { get; set; }
        public int wedsrijdId { get; set; }
    
        public virtual ProefCategorie ProefCategorie { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Resultaat> Resultaten { get; set; }
        public virtual Wedstrijd Wedstrijd { get; set; }
    }
}
