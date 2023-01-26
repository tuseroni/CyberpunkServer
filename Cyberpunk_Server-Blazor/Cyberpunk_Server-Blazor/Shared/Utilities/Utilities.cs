using System.Diagnostics;
using System.Security.Cryptography;

namespace Cyberpunk_Server_Blazor.Shared.Utilities
{
    public static class Dice
    {
		/// <summary>
		/// Generates a random integer within a specified range using the 
		/// System.Security.Cryptography.RandomNumberGenerator class.
		/// </summary>
		/// <param name="low">The minimum value for the random integer.(Inclusive)</param>
		/// <param name="high">The maximum value for the random integer.(Exclusive)</param>
		/// <returns>A random integer within the specified range.</returns>
		public static int GetRandomRange(int low, int high)
		{
			int rand;
			using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
			{
				byte[] randomBytes = new byte[1];
				rng.GetBytes(randomBytes);
				rand = (int)(randomBytes[0] % (high - low)) + low;
			}
			return rand;
		}
		/// <summary>
		/// Generates a random integer within the range of 1 to 10 
		/// </summary>
		/// <returns>The final result of the dice roll.</returns>
		public static int RollD10()
		{
			int ret = 0;
			int rand;

			ret = rand = GetRandomRange(1, 11);
			return ret;
		}
		/// <summary>
		/// Generates N random integers within the range of 1 to 10 
		/// </summary>
		/// <returns>The final sum of the dice rolls.</returns>
		public static int RollND10(int n)
		{
			var ret = 0;
			for (var i = 0; i < n; i++)
			{
				ret += RollD10();
			}
			return ret;
		}
		/// <summary>
		/// Generates N random integers within the range of 1 to 6 
		/// </summary>
		/// <returns>The final sum of the dice rolls.</returns>
		public static int RollND6(int n)
		{
			var ret = 0;
			for (var i = 0; i < n; i++)
			{
				int rand = GetRandomRange(1, 7);
				ret += rand;
			}
			return ret;
		}
		/// <summary>
		/// Generates a random integer within the range of 1 to 6 
		/// </summary>
		/// <returns>The final result of the dice roll.</returns>
		public static int RollD6()
		{
			return RollND6(1);
		}
	}
}
