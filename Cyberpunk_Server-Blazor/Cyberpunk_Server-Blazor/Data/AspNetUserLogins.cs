using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class AspNetUserLogins
{
    public string LoginProvider { get; set; } = null!;

    public string ProviderKey { get; set; } = null!;

    public string? ProviderDisplayName { get; set; }

    public string UserId { get; set; } = null!;

    public virtual AspNetUsers User { get; set; } = null!;
}
