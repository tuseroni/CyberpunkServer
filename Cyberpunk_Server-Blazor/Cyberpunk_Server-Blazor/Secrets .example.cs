namespace Cyberpunk_Server_Blazor
{
	public static class Secrets
	{
		public static Dictionary<string, string> Secret = new Dictionary<string, string>
		{
			{"Authentication:Google:ClientSecret", "[Client Secret]" },
			{ "Authentication:Google:ClientId", "[Client ID]" },
			{ "ConnectionStrings:Cyberpunk-Connection", "[connection string]" }
		};//this exists only because the normal secrets file doesn't seem to work all that well. you can fill in secrets here, just include the file in the project, remove the .example part if you want.
	}
}
